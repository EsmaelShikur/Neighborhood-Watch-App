import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import the home screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neighborhood Watch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Set the home screen here
    );
  }
}
