import 'package:flutter/material.dart';
import 'package:projet_roman/composants/Login.dart';
import 'package:projet_roman/composants/Teste.dart';
import 'package:projet_roman/composants/inscription.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.green,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Roman",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  fontFamily: "arial")),
          SizedBox(height: 30),
          FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Text(
              "Se connecter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            color: Colors.white,
            minWidth: MediaQuery.of(context).size.width - 80,
          ),
          SizedBox(height: 30),
          FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Teste()));
            },
            child: Text(
              "S'inscrire",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            color: Colors.white,
            minWidth: MediaQuery.of(context).size.width - 80,
          ),
        ],
      )),
    ));
  }
}
