import 'package:flutter/cupertino.dart';

class UserModel {
  String? uid;
  String? fullName;
  String? email;
  String? phoneNumber;
  

  UserModel({this.uid, this.fullName, this.email, this.phoneNumber});


  //Receiving Data from Server

  factory UserModel.fromMap(dynamic map){
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber']
    );
  }

  //Sending data to server

  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber
    };
  }




}

