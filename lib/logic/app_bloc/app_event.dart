part of 'app_bloc.dart';

abstract class AppEvent extends Equatable 
{
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutResquested extends AppEvent
{
  // final UserData user;
  // const AppLogoutResquested({required this.user});
}

class AppUserChanged extends AppEvent
{
  final UserData user;
  const AppUserChanged({required this.user});
  @override
  List<Object> get props => [user];
}

class AddMedicineToUser extends AppEvent
{
  final UserData user;
  List<Medicine> medList;
  AddMedicineToUser({required this.user,required this.medList});
  List<Object> get props => [user];
}

