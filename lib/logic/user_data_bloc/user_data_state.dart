part of 'user_data_bloc.dart';

class UserDataState extends Equatable 
{
  final UserData? userData;
  const UserDataState
  ({
    this.userData
  });
  
  @override
  List<Object> get props => [];
}

// class UserDataInitial extends UserDataState {}
