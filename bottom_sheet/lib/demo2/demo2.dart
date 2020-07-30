
import 'package:bottom_sheet/model/user.dart';
import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  final ValueChanged data;
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
        Text('asjalksnas'),
        ListView.builder(
          itemCount:list.length ,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(list[index].name),
            );

          }),
      ],

    );
  }
  @override
  void initState() {
    super.initState();
    //print("list ${list.length}");
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
}
