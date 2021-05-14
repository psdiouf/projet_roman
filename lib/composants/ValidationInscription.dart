import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'dart:async';
import 'package:mailer/smtp_server.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/DashBoard.dart';
import 'package:roman/composants/EnvoiMail.dart';

class Validation extends StatefulWidget {
  var info;

  Validation({this.info});
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  bool c = true;
  String t = "";
  var cle = GlobalKey<FormState>();
  String v1, v2, v3, v4;
  FocusNode pin2;
  FocusNode pin3;
  FocusNode pin4;

  @override
  void dispose() {
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
    print(widget.info);
  }

  suivant(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  envoi() {
    EnvoiMail(email: widget.info['email'], code: widget.info['code']).envoi();
    // String username = 'testeapplicationflutter@gmail.com';
    // String password = 'Teste2021';

    // final smtpServer = gmail(username, password);
    // // Use the SmtpServer class to configure an SMTP server:
    // // final smtpServer = SmtpServer('smtp.domain.com');
    // // See the named arguments of SmtpServer for further configuration
    // // options.

    // // Create our message.
    // final message = Message()
    //   ..from = Address(username, 'Assane')
    //   ..recipients.add('alassdiallo58@gmail.com')
    //   // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //   // ..bccRecipients.add(Address('bccAddress@example.com'))
    //   ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    //   ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    //   ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    // try {
    //   final sendReport = await send(message, smtpServer);
    //   print('Message sent: ' + sendReport.toString());
    // } on MailerException catch (e) {
    //   print('Message not sent.');
    //   for (var p in e.problems) {
    //     print('Problem: ${p.code}: ${p.msg}');
    //   }
    // }
  }

  valider() {
    if (cle.currentState.validate()) {
      String code = v1 + v2 + v3 + v4;
      if (code == widget.info['code']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashBord()));
      } else {
        setState(() {
          c = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          width: double.infinity,

          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(
                "images/Logo_couleur.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
              // Text("Roman",
              //     style: TextStyle(
              //         color: Colors.green,
              //         fontSize: 50,
              //         fontStyle: FontStyle.italic,
              //         fontWeight: FontWeight.w500,
              //         fontFamily: "arial")),

              SizedBox(
                height: 10,
              ),
              Text(
                "Verification compte",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                text:
                    "Un email contenant le code de validation vous a été envoyé à l'adresse email suivant ",
                style: TextStyle(color: Colors.black, height: 1.5),
                children: [
                  TextSpan(
                    text: widget.info['email'],
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " verifiez et saisissez le code ici",
                  )
                ],
              )),
              SizedBox(
                height: 30,
              ),
              Form(
                key: cle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "";
                          }
                        },
                        autovalidate: true,
                        onChanged: (value) {
                          setState(() {
                            v1 = value;
                          });
                          suivant(value, pin2);
                        },
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        // maxLength: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "";
                          }
                        },
                        autovalidate: true,
                        focusNode: pin2,
                        onChanged: (value) {
                          setState(() {
                            v2 = value;
                          });
                          suivant(value, pin3);
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        // maxLength: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "";
                          }
                        },
                        autovalidate: true,
                        focusNode: pin3,
                        onChanged: (value) {
                          setState(() {
                            v3 = value;
                          });
                          suivant(value, pin4);
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        // maxLength: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "";
                          }
                        },
                        autovalidate: true,
                        focusNode: pin4,
                        onChanged: (value) {
                          setState(() {
                            v4 = value;
                          });
                          pin4.unfocus();
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        //maxLength: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              !c
                  ? SizedBox(
                      height: 20,
                      child: Text("erreur le code n'est pas valide",
                          style: TextStyle(color: Colors.red)),
                    )
                  : Text(""),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  minWidth: MediaQuery.of(context).size.width - 100,
                  textColor: Colors.white,
                  color: rouge,
                  onPressed: valider,
                  child: Text("valider")),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  child: Text("Renvoyer le code ?",
                      style: TextStyle(color: Colors.blue)),
                  onTap: envoi)
            ],
          ),
        ),
      ),
    ));
  }
}
