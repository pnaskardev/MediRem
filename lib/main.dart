import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:medi_rem/auth_gate.dart';
import 'package:medi_rem/common/navbar/bloc/cubit/navigation_cubit.dart';
import 'package:medi_rem/firebase_options.dart';
import 'package:medi_rem/utils/colors.dart';


Future<void> main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterFireUIAuth.configureProviders
  ([
    const EmailProviderConfiguration(),
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
    return MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create:(BuildContext context) => NavigationCubit()),
      ],
      child: MaterialApp
      (
        title: 'MediRem',
        theme: ThemeData
        (
          useMaterial3: true,
          primaryColor: primaryColor,
        ),
        themeMode: ThemeMode.system,
        home: const AuthGate(),
      ),
    );
  }
}


