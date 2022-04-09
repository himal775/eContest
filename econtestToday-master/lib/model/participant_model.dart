import 'package:flutter/cupertino.dart';

class ParticipantModel {
  String? contestant_name;
  String? contestant_image;
  String? contestant_dob;
  String? phone_number;
  

  ParticipantModel({this.contestant_name, this.contestant_dob, this.contestant_image, this.phone_number});


  //Receiving Data from Server

  factory ParticipantModel.fromMap(dynamic map){
    return ParticipantModel(
      contestant_name: map['contestant_name'],
      contestant_image: map['contestant_image'],
      contestant_dob: map['contestant_dob'],
      phone_number: map['phone_Number']
    );
  }

  //Sending data to server

  Map<String, dynamic> toMap(){
    return{
      'contestant_name': contestant_name,
      'contestant_image': contestant_image,
      'contestant_dob': contestant_dob,
      'phone_number': phone_number
    };
  }




}
