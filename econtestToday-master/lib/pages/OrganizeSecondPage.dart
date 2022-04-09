import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/pages/OrganizeFirstPage.dart';
import 'package:flutter/material.dart';
import 'package:econtest/pages/OrganizeThirdPage.dart';

class Completion extends StatefulWidget {
  const Completion({Key? key}) : super(key: key);

  @override
  State<Completion> createState() => _CompletionState();
}

class _CompletionState extends State<Completion> {

  //Controller to store data in firebase

  final organizerController = new TextEditingController();
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();
  final aboutController = new TextEditingController();
  final dateController = new TextEditingController();
  final imageController = new TextEditingController();


  //Initializing the Firebase Firestore
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("WritingContest");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Photos Category",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildOrganizerImage(context),
          SizedBox(
            height: 10,
          ),
          _buildOrganizerDetails(context),
        ],
      ),
    );
  }

  Widget _buildOrganizerImage(BuildContext context) {
    return Container(
      child: Image.network(
        'https://europamundoblog.com/wp-content/uploads/02.png',
      ),
    );
  }

  Widget _buildOrganizerDetails(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Align(
              alignment: Alignment(-0.8, 1),
              child: Text(
                "Organizer's Name",
                style: TextStyle(fontFamily: 'Lato', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 350,
            child: TextField(
              controller: organizerController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Organizer's Name",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment(-0.8, 1),
              child: Text(
                "Contest Title",
                style: TextStyle(fontFamily: 'Lato', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 350,
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter title of Contest',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: const Align(
              alignment: Alignment(-0.40, 1),
              child: const Text(
                "Contest Description (include details of prize )",
                style: TextStyle(fontFamily: 'Lato', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 350,
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Contest Description',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: const Align(
              alignment: Alignment(-0.80, 1),
              child: const Text(
                "About Organizer",
                style: TextStyle(fontFamily: 'Lato', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 90,
            width: 350,
            child: TextField(
              controller: aboutController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter about Organizer',
              ),
            ),
          ),
          Container(
            child: const Align(
              alignment: Alignment(-0.80, 1),
              child: const Text(
                "Enter Image URL",
                style: TextStyle(fontFamily: 'Lato', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            width: 350,
            child: TextField(
              controller: imageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter URL of Image',
              ),
            ),
          ),
          // Container(
          //   child: Align(
          //     alignment: Alignment(-0.80, 1),
          //     child: Text(
          //       "Upload Feature photo ",
          //       style: TextStyle(fontFamily: 'Lato', fontSize: 16),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   child: Align(
          //     alignment: Alignment(-0.8, 1),
          //     child: RaisedButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Click to Upload",
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //   ),
          // ),

          
            
          RaisedButton(
            child: Text("Submit"),
            onPressed: () async{
              await collectionReference.add({
                'eventName': organizerController.text,
                'eventOrganizer': titleController.text,
                'eventDescription': descriptionController.text,
                'eventDate': dateController.text,
                'eventImage': imageController.text,
              });
              organizerController.clear();
              titleController.clear();
              descriptionController.clear();
              dateController.clear();
              imageController.clear();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Success()),
              );
            },
          ),
        ],
      ),
    );
  }



   
}

