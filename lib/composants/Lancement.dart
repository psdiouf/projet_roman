import 'dart:async';

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:roman/composants/Accueil.dart';
import 'package:roman/composants/Couleur.dart';

class Lancement extends StatefulWidget {
  @override
  _LancementState createState() => _LancementState();
}

class _LancementState extends State<Lancement> {
  void connexion() async {
    final con = PostgreSQLConnection('localhost', 5432, 'postgres',
        username: 'postgres', password: 'assane10', useSSL: true);
    try {
      await con.open();
      print("connexion reussi");
    } catch (e) {
      print("erreur");
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Accueil()));
    });
    connexion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: rouge,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/Logo_blanc.png",
                  height: MediaQuery.of(context).size.height / 3,
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                  //backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
