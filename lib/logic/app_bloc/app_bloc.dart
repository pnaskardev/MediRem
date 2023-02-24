import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/user_data.dart';
import 'package:medi_rem/repository/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> 
{
  final AuthRepository _authRepository;
  StreamSubscription<UserData?>? _userSubscription;
  AppBloc({required AuthRepository authRepository}):_authRepository=authRepository,
  super
  (
    authRepository.currentUser.isNotEmpty?
    AppState.authenticated(authRepository.currentUser):
    const AppState.unauthenticated()
  )
  {

    _userSubscription=_authRepository.getUser.listen((user) 
    {
      return add(AppUserChanged(user: user));
    });

    on<AppUserChanged>((event, emit) 
    {
      emit
      (
        event.user.isNotEmpty ? 
        AppState.authenticated(event.user)
        :
        const AppState.unauthenticated()
      );
    });

    on<AppLogoutResquested>((event,emit)
    {
      unawaited(_authRepository.logOut());
    });

    Future<void> close()
    {
      _userSubscription?.cancel();
      return super.close();
    }
    
  }

}
