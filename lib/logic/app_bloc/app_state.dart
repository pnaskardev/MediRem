part of 'app_bloc.dart';


enum AppStatus{authenticated,unauthenticated}
class AppState extends Equatable 
{
  final AppStatus status;
  final  UserData user;
  const AppState._
  ({
    required this.status,
    this.user=UserData.empty,
  });
  
  const AppState.medicineChanged(UserData user):this._
  (
    status: AppStatus.authenticated,
    user: user
  );
  const AppState.authenticated(UserData user):this._
  (
    status: AppStatus.authenticated,
    user: user
  );

  const AppState.unauthenticated():this._
  (
    status: AppStatus.unauthenticated
  );

  @override
  List<Object> get props => [status,UserData];
}




