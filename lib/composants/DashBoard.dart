import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/Login.dart';
import 'package:roman/composants/creationprofil.dart';
import 'package:roman/composants/discussion/discussions.dart';
import 'package:roman/composants/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roman/Controller/Connexion.dart';
import 'dart:async';
import 'package:roman/composants/fairerecherche.dart';
import 'dart:convert' as convert;

class DashBord extends StatefulWidget {
  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  var token;

  void verifToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    token = localStorage.getString("token");
    if (token == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  void initState() {
    verifToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          // backgroundColor: rouge,
          drawer: Menu(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: rouge,
            actions: [
              IconButton(
                  icon: Icon(Icons.chat, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Discussions()));
                  }),
              IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Fairerecherche()));
                  }),
              PopupMenuButton(
                  initialValue: 0,
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('profil'),
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Text("Se deconnecter"),
                          onTap: logout,
                        ),
                      )
                    ];
                  })
            ],
          ),
          body: SafeArea(
            child: Container(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: rouge,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40))),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(children: [
                    IconButton(
                      iconSize: 80,
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: Text("user"),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreationProfil()));
                      },
                    ),
                    Expanded(
                      child: Text(
                        "ASSANE DIALLO ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ]),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Center(child: Text("Bienvenue sur votre espace")),
                ))
              ],
            )),
          )),
    );
  }

  void logout() async {
    var res = await Connexion().deconnexion('logout');
    var body = convert.jsonDecode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
