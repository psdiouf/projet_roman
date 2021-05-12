import 'package:flutter/material.dart';
import 'package:projet_roman/composants/EnvoiMail.dart';
import 'package:projet_roman/composants/ValidationInscription.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final cle = GlobalKey<FormState>();
  bool _obscureText = true;
  String login, mp, email, config;

  connexion() {
    if (cle.currentState.validate()) {
      EnvoiMail(email: email).envoi();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Validation()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
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
                Form(
                    key: cle,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              login = value;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "veuillez entrer votre pseudo";
                            }
                          },
                          decoration: InputDecoration(
                              focusColor: Colors.green,
                              prefixIcon: Icon(Icons.person),
                              labelText: "entrer votre pseudo",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autovalidate: false,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Entrer une adresse email valide';
                            }
                          },
                          decoration: InputDecoration(
                              focusColor: Colors.green,
                              prefixIcon: Icon(Icons.mail),
                              labelText: "entrer votre email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          onChanged: (value) {
                            setState(() {
                              mp = value;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "veuillez entrer votre mot de passe";
                            }
                          },
                          decoration: InputDecoration(
                              focusColor: Colors.white,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: _obscureText
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              labelText: "entrer votre mot de passe",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          onChanged: (value) {
                            setState(() {
                              config = value;
                            });
                          },
                          autovalidate: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "veuillez confirmer votre mot de passe";
                            } else {
                              if (config != mp) {
                                return "les deux mot de passe ne correspondent pas";
                              }
                            }
                          },
                          decoration: InputDecoration(
                              focusColor: Colors.white,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: _obscureText
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              labelText: "confirmer votre mot de passe",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            minWidth: MediaQuery.of(context).size.width,
                            textColor: Colors.white,
                            color: Colors.green,
                            onPressed: connexion,
                            child: Text("S'inscrire"))
                      ],
                    )),
              ],
            ),
          )),
    ));
  }
}
