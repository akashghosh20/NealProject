import 'package:flutter/material.dart';
import 'package:project_neal/HomePage.dart';

void main() {
  runApp(const ProjectNealApp());
}

class ProjectNealApp extends StatelessWidget {
  const ProjectNealApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProjectNeal',
      // ignore: prefer_const_constructors
      home: HomePage(),
    );
  }
}
