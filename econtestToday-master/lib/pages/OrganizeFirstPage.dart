import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:econtest/pages/OrganizeSecondPage.dart';

class Organizer extends StatefulWidget {
  @override
  _OrganizerState createState() => _OrganizerState();
}

late TabController _tabController;

List text = [
  "Photo Contest",
  "Writing Contest",
  "Video Contest",
  "Quiz Contest"
];

List value = [
  'assets/images/photo_contest.png',
  'assets/images/quiz.jpg',
  'assets/images/video_competition.jpg',
  'assets/images/contest.jpg'
];

class _OrganizerState extends State<Organizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Organize a Contest',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Choose a Contest you want to Organize.",
              style: TextStyle(
                  color: Colors.black, fontFamily: "Lato", fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: List.generate(4, (index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Completion()),
                            );
                          },
                          color: Colors.white10,
                          child: Container(
                              child: Stack(children: [
                            Image.asset(
                              value[index],
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              text[index],
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]))),
                    ),
                  );
                }),
              ),
            ),
          ),
        ]));
  }
}
