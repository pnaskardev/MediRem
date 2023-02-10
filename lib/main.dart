import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:medi_rem/auth_gate.dart';
import 'package:medi_rem/features/home/screens/home_screen.dart';
import 'package:medi_rem/firebase_options.dart';


Future<void> main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterFireUIAuth.configureProviders
  ([
    const PhoneProviderConfiguration(),
  ]);
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
      home: const AuthGate(),
    );
  }
}


