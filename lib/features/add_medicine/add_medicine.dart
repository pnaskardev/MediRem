import 'package:flutter/material.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Text('Add Medicine'),
        ),
      ),
    );
  }
}