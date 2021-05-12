import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projet_roman/composants/inscription.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  String desc = ".............";
  String g = "";
  String e = "";
  String v = "";
  int rep = 0;
  Timer timer;
  final int temps = 10;
  int t;

  @override
  void initState() {
    t = temps;
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  reessayer() {
    Navigator.pop(context);
    setState(() {
      t = temps;
    });
  }

  inscription() {
    Navigator.pop(context);
    setState(() {
      t = temps;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Inscription()));
  }

  void commencer() {
    timer = Timer.periodic(Duration(seconds: 1), (ti) {
      print(ti);
      if (t < 1) {
        print("temps ecoulé");
        timer.cancel();
        terminer();
      } else {
        setState(() {
          t--;
        });
      }
    });
  }

  terminer() {
    // Alert(
    //   context: context,
    //   type: AlertType.warning,
    //   title: "Rsultat",
    //   desc: "vos resultat",
    //   buttons: [
    //     DialogButton(
    //       child: Text(
    //         "FLAT",
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //       onPressed: () => Navigator.pop(context),
    //       color: Color.fromRGBO(0, 179, 134, 1.0),
    //     ),
    //     DialogButton(
    //       child: Text(
    //         "GRADIENT",
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //       onPressed: () => Navigator.pop(context),
    //       gradient: LinearGradient(colors: [
    //         Color.fromRGBO(116, 116, 191, 1.0),
    //         Color.fromRGBO(52, 138, 199, 1.0)
    //       ]),
    //     )
    //   ],
    // ).show();
    Alert(
      closeIcon: Icon(Icons.close),
      context: context,
      onWillPopActive: true,
      // style: alertStyle,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            rep < 1 ? "reéssayer" : "passer a l'inscription",
            // style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: rep < 3 ? reessayer : inscription,
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
  // CountDownController _controller = CountDownController();

  // temps() {
  //   Timer(Duration(seconds: 3), () {
  //     print("Temps ecoulé");
  //   });
  // }

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
              SizedBox(height: 20),
              CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 0,
                lineWidth: 15.0,
                percent: t.toDouble() / temps,
                center: new Text(
                  t.toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.green,
                progressColor: t < 10 ? Colors.red : Colors.blue,
              ),
              SizedBox(
                height: 50,
              ),

              // Timer(Duration(seconds: 5), temps),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Container(
                    child: Text(
                        "Il ${desc} du toit via la   le soleil rayonnait si fort que c  était délicieux v jouissif pour les lézards"),
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
                    onPressed: commencer,
                    // () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Inscription()));
                    // },
                    child: Text("commencer")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
