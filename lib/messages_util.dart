import 'package:flutter/material.dart';

class Message extends StatelessWidget{

  final String _name = 'msverma';
  final String _text;

  Message(this._text);

  @override
  Widget build(BuildContext context){
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 05.0),
                child: new Text(this._text)
              )
            ],
          )
        ],
      ),
    );
  }
}