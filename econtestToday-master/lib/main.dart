// import 'dart:js';

import 'package:econtest/controller/data_controller.dart';
import 'package:econtest/pages/event_Overview.dart';
import 'package:econtest/pages/homepage.dart';
import 'package:econtest/pages/login_screen.dart';
import 'package:econtest/providers/event_provider.dart';
import 'package:econtest/widgets/NavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventProvider>(
      // Using Provider Packages
      create: (context) => EventProvider(),
      //Using Getx Packages
      child: GetMaterialApp(
        title: 'E-Contest',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: LoginScreen(),
        
      ),
    );
  }
}

