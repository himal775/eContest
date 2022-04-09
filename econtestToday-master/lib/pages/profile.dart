import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/model/user_mode.l.dart';
import 'package:econtest/pages/homepage.dart';
import 'package:econtest/pages/login_screen.dart';
import 'package:econtest/widgets/NavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //Initializing the firebase auth
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  // Creating Method to get data from firebase
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        setState(() {});
      });
    }

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          
           icon: Icon(Icons.arrow_back),
           color: Colors.black,
           onPressed: (){
            //  Navigate to HomeScreen
            Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyBottomNavBar()));
           },
         ),
        centerTitle: true,
        title: Text("eContest",
        style: TextStyle(
          color: Colors.black,  
          fontWeight: FontWeight.w700,        
        ),
        ),
        backgroundColor: Colors.white,
        
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Text("Profile Page"),

             SizedBox(
                height: 10,
              ),
              Text("Name: ${loggedInUser.fullName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("Email: ${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),

              Text("Phone Number: ${loggedInUser.phoneNumber}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),

                
              SizedBox(
                height: 15,
              ),

               ActionChip(label: Text("Log out"), 
            onPressed: (){
              logout(context);
            })
            
            
          ],
        ),
      ),
      
     
    );

   }

   Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

   
}