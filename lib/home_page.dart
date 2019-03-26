import 'package:flutter/material.dart';
import 'package:chatapp/chat_screen.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dummy Chat'),
        centerTitle: true,
      ),
      body: new ChatScreen()
    );
  }

}