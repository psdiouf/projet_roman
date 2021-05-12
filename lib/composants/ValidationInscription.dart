import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'dart:async';
import 'package:mailer/smtp_server.dart';
import 'package:projet_roman/composants/EnvoiMail.dart';

class Validation extends StatefulWidget {
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
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
  }

  suivant(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  envoi() {
    EnvoiMail(email: "alassdiallo58@gmail.com").envoi();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Roman",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontFamily: "arial")),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Divider(
                    thickness: 5,
                    color: Colors.green,
                  ),
                  Divider(
                    indent: 50,
                    thickness: 5,
                    color: Colors.green,
                  ),
                  Divider(
                    indent: 100,
                    thickness: 5,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Verification compte",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Un email vous a été envoyé à votre compte veuillez verifier et saisir le numero",
              style: TextStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      onChanged: (value) {
                        suivant(value, pin2);
                      },
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      // maxLength: 1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      focusNode: pin2,
                      onChanged: (value) {
                        suivant(value, pin3);
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      // maxLength: 1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      focusNode: pin3,
                      onChanged: (value) {
                        suivant(value, pin4);
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      // maxLength: 1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      focusNode: pin4,
                      onChanged: (value) {
                        pin4.unfocus();
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      //maxLength: 1,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              height: 30,
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 20),
                minWidth: MediaQuery.of(context).size.width - 100,
                textColor: Colors.white,
                color: Colors.green,
                onPressed: envoi,
                child: Text("valider")),
          ],
        ),
      ),
    ));
  }
}
