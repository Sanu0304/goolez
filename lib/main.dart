import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goolez/firebase_options.dart';
import 'package:goolez/screens/homepage.dart';
import 'package:goolez/screens/loginpage.dart';
import 'package:goolez/screens/registerpage.dart';
import 'package:goolez/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: AppFirebaseOptions.android,
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
