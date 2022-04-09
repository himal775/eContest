// import 'package:econtest/pages/event_Overview.dart';
// import 'package:econtest/providers/event_provider.dart';
// import 'package:econtest/widgets/NavigationBar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TakePart extends StatelessWidget {
//   @override
//   final String eventImage;

//   TakePart({
//     required this.eventImage
//     });
//     late EventProvider eventProvider;

//   @override
//   Widget build(BuildContext context) {
//      eventProvider = Provider.of(context);

//      return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(         
//            icon: Icon(Icons.arrow_back),
//            color: Colors.black,
//            onPressed: (){
//             //  Navigate to HomeScreen
//             Navigator.pop(context,
//               MaterialPageRoute(builder: (context) => MyBottomNavBar()));
//            }
//          ),
//         centerTitle: true,
//         title: Text(
//           "Participate",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),

//        body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10, 
//               ),
//               Text(
//                 "Writing Contest",
//                 textAlign:TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22
//                 ),
                
//                 ),
//               Container(
//                 height: 250,
//                 child: Image.network(eventImage),
//               ),
//           ]
          
//      ))));
     
//      }
// }
import 'dart:io';

import 'package:econtest/controller/data_controller.dart';
import 'package:econtest/pages/take_part_image.dart';
import 'package:econtest/widgets/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TakePartScreen extends StatefulWidget {
  const TakePartScreen({ Key? key }) : super(key: key);

  @override
  _TakePartScreenState createState() => _TakePartScreenState();
}

class _TakePartScreenState extends State<TakePartScreen> {
  


  final DataController controller = Get.put(DataController());

  var _userImageFile;
   final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> takePartData = {
    "p_name": "",
    "p_DOB": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": ""
  };

  void _pickedImage(File image) {
    _userImageFile = image;

    print ("Image Got $_userImageFile");

   
    
  }


addProduct() {

  if (_userImageFile == null) {
      Get.snackbar(
        "Opps",
        "Image Required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme.of(context).errorColor,
        colorText: Colors.white,
      );
      return;

  }

     _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");
      
      print('Data for login $takePartData');
      controller.addNewProduct(takePartData, _userImageFile);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      // backgroundColor: Theme.of(context).backgroundColor,
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
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full Name is Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    takePartData['c_name'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date of Birth Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    takePartData['c_DOB'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number  Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    takePartData['phone_number'] = value!;
                  },
                ),
                SizedBox(
                  height: 30,
                ),

                TakeImage(_pickedImage),
                
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
          
                      primary: Colors.black
                    
                  ),
                  onPressed: addProduct,
                  child: Text('Submit',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 22),
                  
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}