
import 'package:bottom_sheet/model/user.dart';
import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  ValueChanged data;
  Demo2({this.data});
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  List<User> list = List<User>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 2,),
        Text('select user',style: TextStyle(color: Colors.red,fontSize: 14),),
        ListView.builder(
            shrinkWrap: true,
                    itemCount:list.length ,
          itemBuilder: (context, index){
              return CustomListTitle(list[index],(){
                setState(() {
                  widget.data(list[index]);
                });
                _onBack(context);
              });
//            return ListTile(
//              title: Text(list[index].name),
//              onTap: (){
//                setState(() {
//                  widget.data(list[index]);
//                  _onBack(context);
//                });
//              },
//            );

          }
          ),
      ],

    );
  }
  @override
  void initState() {
    super.initState();
    initList();
  }
  initList(){
  setState(() {
    list =  _addData();
    print("list 1${list.length}");
  });

  }

  List<User>_addData(){
     List<User> users = List<User>();
     users.add(User('Tu', 'tu@gmail.com', '098891928'));
    users.add(User('Van A', 'vana@gmail.com', '0735457776'));
    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
    return users;
  }
  _onBack(BuildContext context){
    Navigator.pop(context);
  }
}
class CustomListTitle extends StatelessWidget{
  User user;
  Function onTap;
  CustomListTitle(this.user,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: InkWell(
          splashColor: Colors.deepOrangeAccent,// color on click
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(user.name, style: TextStyle(color: Colors.blue, fontSize: 16),),
                  ),
                ],),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
