import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget 
{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Text('SettingsPage'),
        ),
      ),
    );
  }
}