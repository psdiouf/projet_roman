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
  String desc = ".............................";
  String g = ".............................";
  String e = ".............................";
  String v = ".............................";
  String rep1 = "descendait";
  String rep2 = "gouttiére";
  String rep3 = "c'en";
  String rep4 = "voir";
  bool db = false;
  var gr1;
  var gr2;
  var gr3;
  var gr4;
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
    setState(() {
      db = true;
    });
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
    int trv = 0;
    if (desc == rep1) {
      trv++;
    }
    if (g == rep2) {
      trv++;
    }
    if (e == rep3) {
      trv++;
    }
    if (v == rep4) {
      trv++;
    }
    timer.cancel();
    Alert(
      closeIcon: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            t = temps;
          });
        },
      ),
      context: context,
      onWillPopActive: true,
      // content: Column(
      //   children: [
      //     Text("premier texte"),
      //     Text("premier texte"),
      //   ],
      // ),
      // style: alertStyle,
      type: trv < 4 ? AlertType.error : AlertType.success,
      title: "Resultats",
      desc: trv < 4
          ? "Désolé vous n'avez pas validé le teste veillez reéssayer"
          : "felicitation vous avez reussi le teste",
      content: Text(
        "trouvés   ${trv}/4",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      buttons: [
        DialogButton(
          child: Text(
            trv < 4 ? "reéssayer" : "passer a l'inscription",
            // style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: trv < 4 ? reessayer : inscription,
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
    setState(() {
      db = false;
    });
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
          color: Colors.white,
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
                // margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Card(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Il ${desc} du toit via la ${g}  le soleil rayonnait si fort que ${e}  était délicieux ${v} jouissif pour les lézards.",
                        style: TextStyle(height: 3),
                      ),
                    ),
                  ),
                ),
              ),
              !db
                  ? Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                          "Pour vous inscrire vous devez d'abord validé ce teste elle dure 1 min aprés le debut"),
                    )
                  : Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            color: Colors.green,
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              //title: Text("descendai"),
                                              value: "descendai",
                                              groupValue: gr1,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr1 = value;
                                                  desc = value;
                                                });
                                              }),
                                          Text("descendai")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              //title: Text("dessendait"),
                                              value: "dessendait",
                                              groupValue: gr1,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr1 = value;
                                                  desc = value;
                                                });
                                              }),
                                          Text("dessendai")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "descendait",
                                              groupValue: gr1,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr1 = value;
                                                  desc = value;
                                                });
                                              }),
                                          Text("descendait")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            color: Colors.green,
                                            child: Text(
                                              "2",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "goutiére",
                                              groupValue: gr2,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr2 = value;
                                                  g = value;
                                                });
                                              }),
                                          Text("goutiére")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "gouttiére",
                                              groupValue: gr2,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr2 = value;
                                                  g = value;
                                                });
                                              }),
                                          Text("gouttiére")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "gouttiaire",
                                              groupValue: gr2,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr2 = value;
                                                  g = value;
                                                });
                                              }),
                                          Text("goutiaire")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            color: Colors.green,
                                            child: Text(
                                              "3",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "s'en",
                                              groupValue: gr3,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr3 = value;
                                                  e = value;
                                                });
                                              }),
                                          Text("s'en")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "c'en",
                                              groupValue: gr3,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr3 = value;
                                                  e = value;
                                                });
                                              }),
                                          Text("c'en")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "sans",
                                              groupValue: gr3,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr3 = value;
                                                  e = value;
                                                });
                                              }),
                                          Text("sans")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            color: Colors.green,
                                            child: Text(
                                              "4",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "voire",
                                              groupValue: gr4,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr4 = value;
                                                  v = value;
                                                });
                                              }),
                                          Text("voire")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "voir",
                                              groupValue: gr4,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr4 = value;
                                                  v = value;
                                                });
                                              }),
                                          Text("voir")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              value: "voar",
                                              groupValue: gr4,
                                              onChanged: (value) {
                                                setState(() {
                                                  gr4 = value;
                                                  v = value;
                                                });
                                              }),
                                          Text("voar")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

              SizedBox(
                height: 30,
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
                    onPressed: !db ? commencer : terminer,
                    // () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Inscription()));
                    // },
                    child: Text(!db ? "commencer" : "soumettre")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
