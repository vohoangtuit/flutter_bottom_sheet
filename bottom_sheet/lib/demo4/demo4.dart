import 'package:bottom_sheet/model/user.dart';
import 'package:flutter/material.dart';

class Demo4 extends StatefulWidget {
  ValueChanged data;
  Demo4({this.data});
  @override
  _Demo4State createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {
  List<User> list = List<User>();
  BorderRadiusTween borderRadius;
  AnimationController controller_;
  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      expand: false,
      builder: (_, controller) {
        return ClipRRect(
         // borderRadius: borderRadius.evaluate(CurvedAnimation(parent: controller, curve: Curves.ease)),
          child: Container(
            color: Colors.white,
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

                }
            ),
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

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(10.0),
      end: BorderRadius.circular(0.0),
    );
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