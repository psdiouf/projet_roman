import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/Login.dart';
import 'package:roman/composants/Teste.dart';
import 'package:roman/composants/inscription.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [rouge, noir],
              end: Alignment.bottomCenter),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/Logo_blanc.png",
              height: MediaQuery.of(context).size.height / 3,
            ),
            // Text("Roman",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 50,
            //         fontStyle: FontStyle.italic,
            //         fontWeight: FontWeight.w500,
            //         fontFamily: "arial")),
            SizedBox(height: 30),
            FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Se connecter",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: rouge),
              ),
              color: Colors.white,
              minWidth: MediaQuery.of(context).size.width - 80,
            ),
            SizedBox(height: 30),
            FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Teste()));
              },
              child: Text(
                "S'inscrire",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: rouge),
              ),
              color: Colors.white,
              minWidth: MediaQuery.of(context).size.width - 80,
            ),
            // Expanded(
            //   child: Container(
            //     color: Colors.red,
            //     child: Text("oui"),
            //   ),
            // )
          ],
        )),
      ),
    ));
  }
}
