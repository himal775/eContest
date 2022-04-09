import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {

    // Using picked image and image picker

  final void Function(File pickedImage) getImageValue;
  TakeImage(this.getImageValue);

  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
   
  var pickedImage;

  


  void imagePickerOption() {
    // Bottom sheet for chosing photo from gallery or camera
     Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
          
                      primary: Colors.black
                    
                  ),
                    onPressed: () {
                      print("Camera is Choosed");
                      pickImage(ImageSource.camera);

                    },
                    icon: Icon(Icons.camera),
                    label: Text("Camera"),
                  ),
                  ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
          
                      primary: Colors.black
                    
                  ),
                    onPressed: () {
                      print("Gallery is Choosed");
                      pickImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.image),
                    label: Text("Gallery"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
          
                      primary: Colors.black
                    
                  ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                    label: Text("Cancel"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final photo = await _picker.pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        this.pickedImage = tempImage;
        widget.getImageValue(pickedImage!);
      });
      // widget.getImageValue(pickedImage!);
      Get.back();
    } catch (error) {
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          child: pickedImage != null
              ? Image.file(
                  pickedImage!,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'https://static.thenounproject.com/png/2413564-200.png',
                  fit: BoxFit.cover,
                ),

        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
          
                      primary: Colors.black
                    
                  ),
          onPressed: imagePickerOption,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );

  }
}