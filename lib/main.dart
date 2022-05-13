import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice1/Widget/buttons.dart';
import 'Datafile/data.dart';
import 'package:flutter/widgets.dart';
import 'package:practice1/Pages/pages.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  int x = 0;
  AdminApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Management System',
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Menu();
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}