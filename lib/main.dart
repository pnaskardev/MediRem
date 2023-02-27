import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:medi_rem/auth_gate.dart';
import 'package:medi_rem/common/navbar/bloc/cubit/navigation_cubit.dart';
import 'package:medi_rem/firebase_options.dart';
import 'package:medi_rem/logic/app_bloc/app_bloc.dart';
import 'package:medi_rem/repository/api_repository.dart';
import 'package:medi_rem/repository/auth_repository.dart';
import 'package:medi_rem/utils/themes.dart';

Future<void> main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
  ]);
  final _authRepository=AuthRepository();
  runApp(MyApp(authRepository: _authRepository,));
}

class MyApp extends StatelessWidget 
{
  final AuthRepository _authRepository;
  const MyApp({super.key,required authRepository})
  : _authRepository=authRepository;
  @override
  Widget build(BuildContext context) 
  {
    return RepositoryProvider.value
    (
      value: _authRepository,
      child: MultiBlocProvider
      (
        providers: 
        [
          BlocProvider(create: (BuildContext context) => AppBloc
          (
            authRepository: _authRepository
          )),
          BlocProvider(create: (BuildContext context) => NavigationCubit()),
          // BlocProvider(create: (BuildContext context) => MedicineApiBloc()),
          RepositoryProvider(create: (context)=>ApiRepository())
        ],
        child: MaterialApp
        (
          title: 'MediRem',
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme,
          home: AuthGate(authRepository:_authRepository),
        ),
      )
    );
  }
}
