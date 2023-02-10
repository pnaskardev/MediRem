import 'package:flutter/material.dart';
import 'package:medi_rem/features/home/screens/home_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'MediRem',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


