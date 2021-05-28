import 'package:flutter/material.dart';
import 'package:roman/composants/deatil.dart';
import 'Couleur.dart';

class Recherche extends StatefulWidget {
  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemBuilder: (context, int index) => Recherchelieu(),
          itemCount: 10,
        ),
      ),
    );
  }
}

class Recherchelieu extends StatefulWidget {
  @override
  _RecherchelieuState createState() => _RecherchelieuState();
}

class _RecherchelieuState extends State<Recherchelieu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profil()));
        },
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height / 1,
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              decoration: BoxDecoration(
                  color: rouge,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage('images/Logo_blanc.png'),
                      fit: BoxFit.contain)),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  // color: rouge.withOpacity(.2),
                  child: Stack(children: [
                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "assane10",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prase de profil',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                      bottom: 20,
                    )
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}
