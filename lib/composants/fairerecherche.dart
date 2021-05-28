import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/recherchelieu.dart';
import 'package:location/location.dart';

class Fairerecherche extends StatefulWidget {
  @override
  _FairerechercheState createState() => _FairerechercheState();
}

class _FairerechercheState extends State<Fairerecherche> {
  String sexe;
  String ville;
  double dbt;
  double fin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: rouge,
          onPressed: rechercherlocalisation,
          child: Icon(Icons.my_location),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
                //padding:EdgeInsets.only(top:30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Image.asset(
                      "images/Logo_couleur.png",
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rechercher\ndes membres",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5)),
                            Spacer(),
                            Expanded(
                                child: Icon(
                              Icons.person,
                              size: 60,
                            ))
                          ])),
                  Divider(
                    thickness: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField(
                                value: sexe,
                                onChanged: (value) {
                                  setState(() {
                                    sexe = value;
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    sexe = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: "choisir le sexe",
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                items: [
                                  DropdownMenuItem(
                                      value: "homme", child: Text('homme')),
                                  DropdownMenuItem(
                                      value: "femme", child: Text('femme')),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "choisir la tranche d'age",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: DropdownButtonFormField(
                                      value: dbt,
                                      onChanged: (value) {
                                        setState(() {
                                          dbt = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          dbt = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          labelText: "debut",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      items: [
                                        DropdownMenuItem(
                                            value: 18, child: Text('18 ans')),
                                        DropdownMenuItem(
                                            value: 20, child: Text('20 ans')),
                                      ]),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: DropdownButtonFormField(
                                      value: fin,
                                      onChanged: (value) {
                                        setState(() {
                                          fin = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          fin = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          labelText: "fin",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      items: [
                                        DropdownMenuItem(
                                            value: 18, child: Text('18 ans')),
                                        DropdownMenuItem(
                                            value: 20, child: Text('20 ans')),
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                                value: ville,
                                onChanged: (value) {
                                  setState(() {
                                    ville = value;
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    ville = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: "choisir la ville",
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                items: [
                                  DropdownMenuItem(
                                      value: "paris", child: Text('paris')),
                                  DropdownMenuItem(
                                      value: "toulouse",
                                      child: Text('toulouse')),
                                ]),
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
                                onPressed: recherche,
                                child: Text("Rechercher"))
                          ],
                        ),
                      ),
                    ),
                  )
                ])),
          ),
        ));
  }

  void recherche() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Recherche()));
  }

  void rechercherlocalisation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
  }
}
