import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goolez/screens/homepage.dart';
import 'package:goolez/screens/loginpage.dart';
import 'package:goolez/screens/registerpage.dart';
import 'package:goolez/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: 'AIzaSyDflPKyUCxlMyv-y8dw_iao5afMNtqTAak',
      appId: "1:3919305352:android:f547d14b6439a12f021d3d",
      messagingSenderId: "3919305352",
      projectId: "zomato-9d26b")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
