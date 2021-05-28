import 'package:flutter/material.dart';
import 'package:roman/composants/Couleur.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("assane"),
          pinned: true,
          floating: false,

          // backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery.of(context).size.height / 3,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/Logo_couleur.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("images"),
                    Divider(),
                    Container(
                      height: 100,
                      color: rouge,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  "images/Logo_blanc.png",
                                  height: 80,
                                  width: 80,
                                ),
                              )),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                color: Colors.green,
              ),
              Container(
                height: 200,
                color: Colors.orange,
              ),
              Container(
                height: 200,
                color: Colors.yellow,
              ),
              Container(
                height: 200,
                color: Colors.purple,
              ),
              Container(
                height: 200,
                color: Colors.black,
              ),
              Container(
                height: 200,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200,
                color: Colors.blueGrey,
              ),
            ]))
      ],
    ));
  }
}
