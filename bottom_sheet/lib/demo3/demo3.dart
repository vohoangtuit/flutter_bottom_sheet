import 'package:bottom_sheet/model/user.dart';
import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  ValueChanged data;
  Demo3({this.data});
  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  List<User> list = List<User>();
  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      expand: false,
//      initialChildSize: 0.3,
//      minChildSize: 0.1,
//      maxChildSize: 0.8,
      builder: (_, controller) {
        return Container(
          color: Colors.black12,
          child: ListView.builder(

              shrinkWrap: true,
              itemCount:list.length ,
              itemBuilder: (context, index){
                return CustomListTitle(list[index],(){
                  setState(() {
                    widget.data(list[index]);
                  });
                  Navigator.pop(context);
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
        );
      },
    );
  }
  _intiList(){
    List<User> users = List<User>();
    users.add(User('Tu', 'tu@gmail.com', '098891928'));
    users.add(User('Van A', 'vana@gmail.com', '0735457776'));
    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
//    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
//    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
//    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));
//    users.add(User('Tôm nguyen', 'tomnguyen@gmail.com', '113232323'));

    setState(() {
      list =users;
    });
  }
  @override
  void initState() {
    super.initState();
    _intiList();
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