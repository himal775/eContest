
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/model/user_mode.l.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DataController extends GetxController {

  // Initializing the Firebase Firestore
  final firebaseInstance = FirebaseFirestore.instance;

  

  // Creating Method of AddNewProduct and changing the value of firebase storage to string
  Future<void> addNewProduct(Map takePartData, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
        FirebaseStorage.instance.ref().child('Participated_Content').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      AlertDialog();
      var response = await firebaseInstance.collection('productlist').add({
        'contestant_name': takePartData['c_name'],
        'contestant_dob': takePartData['c_DOB'],
        "contestant_upload_date": takePartData['p_upload_date'],
        'contestant_image': imageUrl,
        "phone_number": takePartData['phone_number'],
      });
      print("Firebase response1111 $response");
      AlertDialog();
      Get.back();
    } catch (exception) {
      AlertDialog();
      print("Error Saving Data at firestore $exception");
    }
  }

  





}