import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {


  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    final double size = 40;

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

        //USing stream Builder to access data from Firebase Firestore
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("productlist").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, int index) {
                  // return Text(snapshot.data!.docs[index]['contestant_name']);
                  DocumentSnapshot productlist = snapshot.data!.docs[index];
                  // return ListTile(
                  //   leading:Image.network(productlist['contestant_image']),
                  //   title:  Text(productlist['contestant_name']),
                  //   subtitle: Text(productlist['contestant_dob']),
                  // );
                  return Card(
                      child: Column(children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        productlist['contestant_image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LikeButton(
                            mainAxisAlignment: MainAxisAlignment.start,
                            size: size,
                            isLiked: isLiked,
                            likeCount: likeCount,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Posted by " + productlist['contestant_name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]));
                });
          },
        ));
  }
}
