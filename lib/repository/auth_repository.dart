import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_rem/models/user_data.dart';

class AuthRepository
{
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
  : _firebaseAuth =firebaseAuth??FirebaseAuth.instance;

  var currentUser=UserData.empty;

  Stream<UserData> get getUser
  {
    log('getUser started');
    return _firebaseAuth.authStateChanges().map((firebaseUser)
    {
      final user=firebaseUser==null?UserData.empty:firebaseUser.toUserData;
      currentUser=user;
      log(currentUser.uid);
      return user;
    });
  }

  Stream<User?> get getFirebaseUser
  {
    log('get firebase user started');
    return _firebaseAuth.authStateChanges();
  }


  Future<void> signUp
  ({
    required String email,
    required String pass
  }) async
  {
    try 
    {
      await _firebaseAuth.createUserWithEmailAndPassword
      (
        email: email, 
        password: pass
      );
    } 
    catch (e) 
    {
      throw Exception(e);
    }
  }

  Future<void> logInWithEmailAndPassword
  ({
    required String email,
    required String pass
  }) async
  {
    try 
    {
      await _firebaseAuth.signInWithEmailAndPassword
      (
        email: email, 
        password: pass
      );  
    } 
    catch (e) 
    {
      throw Exception(e);
    }
  }

  Future<void>logOut() async
  {
    try 
    {
      await Future.wait([_firebaseAuth.signOut()]);  
    } catch (e) 
    {
      throw Exception(e);  
    }
  }


}

extension on User
{
  UserData get toUserData
  {
    return UserData(uid: uid,email: email!);
  }
}
