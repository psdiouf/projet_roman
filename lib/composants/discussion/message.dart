import 'package:flutter/material.dart';
import 'package:roman/composants/discussion/messageType.dart';
import 'package:roman/composants/models/Messages.dart';

class Message extends StatefulWidget {
  Messages sms;
  Message({this.sms});
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        alignment: (widget.sms.type == MessageType.receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: widget.sms.type == MessageType.receiver
                        ? Colors.blue
                        : Colors.blue[100],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(widget.sms.contenu))
            ]));
  }
}
