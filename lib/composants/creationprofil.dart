import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';

class CreationProfil extends StatefulWidget {
  @override
  _CreationProfilState createState() => _CreationProfilState();
}

class _CreationProfilState extends State<CreationProfil> {
  String vie;
  String enfant;
  String ville;

  var sortir;

  var loisir;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Creation de Profil'), backgroundColor: rouge),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Icon(Icons.camera_alt),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "entrer votre text de profil",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "phrase audio",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              labelText: "ville",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                          items: [
                            DropdownMenuItem(
                              child: Text("Paris"),
                              value: "paris",
                            ),
                            DropdownMenuItem(
                              child: Text("Marseille"),
                              value: "marseille",
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Quel est votre artiste préféré ?",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Quelle est votre serie préférée ?",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 20),
                      Text("vivez-vous seul ?"),
                      RadioListTile(
                          title: Text("oui"),
                          value: "oui",
                          groupValue: vie,
                          onChanged: (value) {
                            setState(() {
                              vie = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("non"),
                          value: "non",
                          groupValue: vie,
                          onChanged: (value) {
                            setState(() {
                              vie = value;
                            });
                          }),
                      Text("avez-vous des enfants ?"),
                      RadioListTile(
                          title: Text("oui"),
                          value: "oui",
                          groupValue: enfant,
                          onChanged: (value) {
                            setState(() {
                              enfant = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("non"),
                          value: "non",
                          groupValue: enfant,
                          onChanged: (value) {
                            setState(() {
                              enfant = value;
                            });
                          }),
                      enfant == "oui"
                          ? TextFormField(
                              decoration: InputDecoration(
                                  labelText: "combien d'enfants avez-vous ?",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            )
                          : Text(""),
                      SizedBox(height: 20),
                      Text("aimez-vous sortir ?"),
                      RadioListTile(
                          title: Text("un peu"),
                          value: "un peu",
                          groupValue: sortir,
                          onChanged: (value) {
                            setState(() {
                              sortir = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("beaucoup"),
                          value: "beaucoup",
                          groupValue: sortir,
                          onChanged: (value) {
                            setState(() {
                              sortir = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("à la folie"),
                          value: "à la folie",
                          groupValue: sortir,
                          onChanged: (value) {
                            setState(() {
                              sortir = value;
                            });
                          }),
                      Text("loisir ?"),
                      RadioListTile(
                          title: Text("randos"),
                          value: "randos",
                          groupValue: loisir,
                          onChanged: (value) {
                            setState(() {
                              loisir = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("netflix"),
                          value: "netflix",
                          groupValue: loisir,
                          onChanged: (value) {
                            setState(() {
                              loisir = value;
                            });
                          }),
                      RadioListTile(
                          title: Text("lecture"),
                          value: "lecture",
                          groupValue: loisir,
                          onChanged: (value) {
                            setState(() {
                              loisir = value;
                            });
                          }),
                      SizedBox(height: 20),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minWidth: MediaQuery.of(context).size.width,
                          textColor: Colors.white,
                          color: rouge,
                          onPressed: () {},
                          child: Text("Créer le profil"))
                    ],
                  ))
            ]),
          ),
        ));
  }
}
