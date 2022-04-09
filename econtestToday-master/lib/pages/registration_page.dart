import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/model/user_mode.l.dart';
import 'package:econtest/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  //Initializing the Firebase auth instance
  final _auth = FirebaseAuth.instance;


  //Showing error msg

  String? errorMessage;


  //Form Key

  final _formkey = GlobalKey<FormState>();

  //Editing Controller
  final fullNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  


  @override
  Widget build(BuildContext context) {
      // Full Name Field
    final fullNameField = TextFormField(
      autofocus: false ,
      controller: fullNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Full Name is required for Sign Up");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Full Name(Min. 3 Character)");
          }return null;
        }, 
      onSaved: (value)
      {
        fullNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Full Name",
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
          
          
        ),
      ),
    );

       // Email Name Field
    final emailField = TextFormField(
      autofocus: false ,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Email is required for Sign Up");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Email Address");
          }return null;
        }, 
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Email",
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
          
          
        ),
      ),
    );

       // password Name Field
    final passwordField = TextFormField(
      autofocus: false ,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Password",
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
          
          
        ),
      ),
    );

    // Confirm password Name Field
    final cPasswordField = TextFormField(
      autofocus: false ,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
          if(confirmPasswordEditingController.text != passwordEditingController.text){
            return "Password doesn't Match";
          }return null;
        },
      
     
      onSaved: (value)
      {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
          
          
        ),
      ),
    );

       // Phone Number Field
    final phoneField = TextFormField(
      autofocus: false ,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
          RegExp regex = new RegExp(r'^.{10,}$');
          if (value!.isEmpty) {
            return ("Phone Number is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Phone Number(Min. 10 Character)");
          }
        },
      onSaved: (value)
      {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Phone Number",
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
          
          
        ),
      ),
    );


    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text("Register Now",
          textAlign: TextAlign.center,
          style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18
        ),
        ),

      ),
    );
    
    
    

  return Scaffold(
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           color: Colors.black,
           onPressed: (){
            //  Navigate to Login
             Navigator.of(context).pop();
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
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36,0,36,180),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 200,
                        child: Image.asset("assets/images/login1.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      fullNameField,

                       SizedBox(
                        height: 20,
                      ),

                      emailField,

                       SizedBox(
                        height: 20,
                      ),

                      passwordField,

                       SizedBox(
                        height: 20,
                      ),

                      cPasswordField,

                           SizedBox(
                        height: 20,
                      ),

                      phoneField,

                        SizedBox(
                        height: 30,
                      ),

                      signUpButton,

                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      
    );
  }

   void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "No internet connectionn";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async
  {
     //Calling our firestore
     //Calling our user Model
     //Sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // Writing all the Values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullNameEditingController.text;
    userModel.phoneNumber = phoneNumberEditingController.text;


    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account has been succesfully created");


    Navigator.pushAndRemoveUntil(context, 
    MaterialPageRoute(builder: (context) => HomeScreen()),
    (route) => false
    );




  }
}