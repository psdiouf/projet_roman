import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/Teste.dart';
import 'package:roman/composants/inscription.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final cle = GlobalKey<FormState>();
  bool _obscureText = true;
  String login, mp;
  bool choix = false;

  connexion() {
    if (cle.currentState.validate()) {
      print("valider");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                //height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/Logo_couleur.png",
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      // Text("Roman",
                      //     style: TextStyle(
                      //         color: Colors.green,
                      //         fontSize: 50,
                      //         fontStyle: FontStyle.italic,
                      //         fontWeight: FontWeight.w500,
                      //         fontFamily: "arial")),
                      SizedBox(
                        height: 20,
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
                                    prefixIcon: Icon(Icons.mail),
                                    labelText: "entrer votre pseudo",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: choix,
                                      onChanged: (b) {
                                        setState(() {
                                          choix = !choix;
                                        });
                                      }),
                                  Text("Se souvenir de moi"),
                                  Spacer(),
                                  GestureDetector(
                                    child: Text(
                                      "mot de passe oublié ?",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                    ),
                                  )
                                ],
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
                                  color: rouge,
                                  onPressed: connexion,
                                  child: Text("Se connecter"))
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "vous n'avez pas de compte ?",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "  s'inscrire",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Teste()));
                                    }),
                            ]),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
