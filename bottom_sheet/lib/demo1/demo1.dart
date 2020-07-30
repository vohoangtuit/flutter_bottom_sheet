import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  final ValueChanged data;
  Demo1({this.data});
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _createTile(context, 'Message', Icons.message, _action1),
        _createTile(context, 'Take Photo', Icons.camera_alt, _action2),
        _createTile(context, 'My Images', Icons.photo_library, _action3),
      ],
    );
  }
  _action1(){
    print('action 1');
    setState(() {
      widget.data("Message");
    });
  }

  _action2(){
    print('action 2');
    setState(() {
      widget.data("Take Photo");
    });
  }

  _action3(){
    print('action 3');
    setState(() {
      widget.data("My Images");
    });
  }
}

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action();
      },
    );
  }
