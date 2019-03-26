import 'package:chatapp/messages_util.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
  @override
  Widget build(BuildContext context){
    return this._getMessagesList();
  }

  final TextEditingController _textEditingController = new TextEditingController();
  final List<Message> _messages = <Message>[];

  Column _getMessagesList(){
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: this._getChatIconTheme(),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: this._getChatTextField(),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: this._getSendButton(),
            )
          ]
        ),
      )
    );
  }

  TextField _getChatTextField(){
    return new TextField(
      autocorrect: true,
      decoration: new InputDecoration.collapsed(
        hintText: 'Send a message'
      ),
      controller: this._textEditingController,
    );
  }

  IconButton _getSendButton(){
    return new IconButton(
      icon: new Icon(Icons.send),
      onPressed: () => {this._handleSubmitButton(this._textEditingController.text)},
    );
  }

  IconThemeData _getChatIconTheme(){
    return new IconThemeData(
      color: Colors.green
    );
  }

  void _handleSubmitButton(String text){
    Message message = new Message(text);
    setState(() {
      _messages.insert(0, message);
    });
    this._textEditingController.clear();
  }
}