import 'package:flutter/material.dart';
import 'package:project3/AdminPanel/AdminPanel.dart';
import 'package:project3/Home.dart';
import 'package:project3/PdfViewer.dart';
import 'package:project3/TestProccessing.dart';
import 'package:project3/UserDashboard/PDFVIEWER.dart';
import 'package:project3/UserDashboard/UserDashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kocaeli university PDF system',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: TestProcessing(),
    );
  }
}
