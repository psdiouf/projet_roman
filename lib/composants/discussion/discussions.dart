import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';
import 'package:roman/composants/discussion/echange.dart';

class Discussions extends StatefulWidget {
  @override
  _DiscussionsState createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: rouge,
          title: Text(
            "Discussion",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Echange()));
                    },
                    leading: CircleAvatar(
                      child: Text("AHD"),
                      radius: 30,
                    ),
                    title: Text("Assane10"),
                    subtitle: Text("bonjour assane comment tu vas"),
                    trailing: Text("21/03/2021"),
                  ),
                  Divider(
                    indent: 60,
                  )
                ],
              );
            },
          ),
        ));
  }
}
