// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/model/event_model.dart';
import 'package:econtest/model/user_mode.l.dart';
import 'package:econtest/pages/login_screen.dart';
import 'package:econtest/pages/profile.dart';
import 'package:econtest/pages/event_Overview.dart';
import 'package:econtest/pages/single_product.dart';
import 'package:econtest/providers/event_provider.dart';
import 'package:econtest/widgets/NavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_Overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late EventProvider eventProvider;
  @override
  Widget _buildWritingEvent(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Writing Contest!",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              "View All>>",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: eventProvider.getWritingContestList.map(
            (writingContestList) {
              return SingalProduct (
                  onTap: () {}
                  , 
                  eventImage: writingContestList.eventImage,
                  eventName: writingContestList.eventName,
                  eventDate: writingContestList.eventDate,
                  eventOrganizer: writingContestList.eventOrganizer,
                  eventDescription: writingContestList.eventDescription,);
            },
          ).toList(),
        
        ),
      ),
    ]);
  }

  Widget _buildPhotoEvent(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Photo Contest!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                  fontSize: 16,
                )),
            Text(
              "View All>>",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Photo Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Anup", eventDescription: '',
            ),
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Photo Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Anup", eventDescription: '',
            ),
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Photo Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Anup", eventDescription: '',
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildQuizEvent(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quiz Contest!",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              "View All>>",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Quiz Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Himal", eventDescription: '',
            ),
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Quiz Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Himal", eventDescription: '',
            ),
            SingalProduct(
              onTap: () {
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => EventOverview()));
              },
              eventImage:
                  "https://i.picsum.photos/id/1032/200/200.jpg?hmac=-JIXcXajDj2GCogfs0jQkvF3T_UiNtvco5Nqbe_Sl4g",
              eventName: "Quiz Contest",
              eventDate: "2057/15/12",
              eventOrganizer: "Himal", eventDescription: '',
            ),
          ],
        ),
      ),
    ]);
  }

  void initState() {
    EventProvider eventProvider = Provider.of(context, listen: false);
    eventProvider.fetchWritingContest();
    super.initState();
  }

  Widget build(BuildContext context) {
    eventProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined),
          color: Colors.black,
          onPressed: () {
            //  Navigate to HomeScreen
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Profile()));
          },
        ),
        centerTitle: true,
        title: Text(
          "eContest",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            _buildWritingEvent(context),
            SizedBox(height: 10),
            _buildPhotoEvent(context),
            SizedBox(height: 10),
            _buildQuizEvent(context),
          ],
        ),
      ),
    );
  }
}
