import 'package:flutter/material.dart';

class DashBord extends StatefulWidget {
  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Container(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30))),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Text("user"),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Center(child: Text("Bienvenue sur votre espace")),
              ))
            ],
          )),
        ));
  }
}
