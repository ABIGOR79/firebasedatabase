import 'package:fibase_lpt/screens/for_test/second_test_screen.dart';
import 'package:fibase_lpt/screens/for_test/test_screen.dart';
import 'package:fibase_lpt/screens/home/workout_list.dart';
import 'package:fibase_lpt/screens/registr/auth.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),        
        useMaterial3: true,
      ),
      home:   Example(),
    );
  }
}





