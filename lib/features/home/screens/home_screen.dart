import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_rem/logic/app_bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final user=BlocProvider.of<AppBloc>(context).getUser;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: user==null ? const Text('User is null'): Text(user!.email)
          // child: Text('HomePage'),
        ),
      ),
    );
  }
}
