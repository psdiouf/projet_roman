import 'package:flutter/material.dart';
import 'package:roman/composants/discussion/message.dart';
import 'package:roman/composants/discussion/messageType.dart';
import 'package:roman/composants/models/Messages.dart';

class Echange extends StatefulWidget {
  @override
  _EchangeState createState() => _EchangeState();
}

class _EchangeState extends State<Echange> {
  List sms = [
    Messages(contenu: "bonjour", type: MessageType.sender),
    Messages(contenu: "oui comment tu vas", type: MessageType.receiver),
    Messages(contenu: "ça va bien et toi", type: MessageType.sender),
    Messages(contenu: "oui cva aussi", type: MessageType.receiver),
    Messages(contenu: "quoi de neuf", type: MessageType.sender),
    Messages(contenu: "rien ?", type: MessageType.sender),
  ];

  String message;

  var cle = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Assane10"),
          leadingWidth: 90,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CircleAvatar(
                radius: 20,
                child: Text("AHD"),
              )
            ],
          ),
        ),
        body: Container(
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                  itemCount: sms.length,
                  itemBuilder: (context, index) => Message(sms: sms[index])),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.blue,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 50,
                        child: Form(
                          key: cle,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                message = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                message = value;
                              });
                            },

                            // autofocus: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(5),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.attach_file,
                                      color: Colors.white,
                                    )),
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "ecrire un message..."),
                          ),
                        )),
                    Expanded(
                      child: FloatingActionButton(
                        elevation: 0,
                        onPressed: envoi,
                        child: Icon(
                          Icons.send,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }

  void envoi() {
    if (message != null && message != "") {
      setState(() {
        sms.add(Messages(contenu: message, type: MessageType.sender));
        message = "";
      });
      cle.currentState.reset();
    }
  }
}
