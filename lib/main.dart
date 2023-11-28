import 'package:firebase_core/firebase_core.dart';
import 'package:firebasew4/addpage.dart';
import 'package:firebasew4/homepage.dart';
import 'package:firebasew4/updatedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC0wtuR4c941D-3gLyZ8TOQqUi8HPd-SLQ",
        appId: "demo3-69430",
        messagingSenderId: "505495768207",
        projectId: "demo3-69430"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: ScreenHome(),
      routes: {
        "ScreenAdd":(context) =>ScreenAdd(),
        "UpdateScreen" :(context) => UpdateScreen(),
      },
    );
  }
}
