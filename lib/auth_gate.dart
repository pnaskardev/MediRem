import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:medi_rem/common/navbar/page/bottom_nav_bar.dart';
import 'package:medi_rem/logic/app_bloc/app_bloc.dart';
import 'package:medi_rem/models/user_data.dart';
import 'package:medi_rem/repository/auth_repository.dart';

class AuthGate extends StatelessWidget 
{
  final AuthRepository _authRepository;
  const AuthGate({super.key,required authRepository})
  : _authRepository=authRepository;

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: StreamBuilder<UserData?>
      (
        // stream: FirebaseAuth.instance.authStateChanges(),
        stream: _authRepository.getUser,
        builder: (context, snapshot) 
        {
          if (!snapshot.hasData) 
          {
            return const SignInScreen
            (
              providerConfigs: 
              [
                EmailProviderConfiguration(),
              ],
            );
          }
          return const AppBottomNavBar();
        },
      ),
    );
  }
}
