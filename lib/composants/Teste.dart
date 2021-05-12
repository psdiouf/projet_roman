import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_roman/composants/inscription.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  String desc, g, e, v;
  // CountDownController _controller = CountDownController();

  temps() {
    print("temps ecoulé");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Roman",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontFamily: "arial")),
              SizedBox(
                height: 50,
              ),
              // Timer(Duration(seconds: 5), temps),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          Text("Il"),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return "le champs est obligatoire";
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  desc = value;
                                });
                              },
                              value: desc,
                              onChanged: (value) {
                                setState(() {
                                  desc = value;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("descendai"),
                                  value: "descendai",
                                ),
                                DropdownMenuItem(
                                  child: Text("descendait"),
                                  value: "descendait",
                                )
                              ]),
                        ],
                      ),
                      Text("du toit via la"),
                      Text("goutiére"),
                      Text("le soleil rayonnait si fort que"),
                      Text("c'en"),
                      Text("était délicieux"),
                      Text("voire"),
                      Text("jouissif pour les lézards"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    minWidth: MediaQuery.of(context).size.width - 50,
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Inscription()));
                    },
                    child: Text("S'inscrire")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
