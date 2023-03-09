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

    // medSubscription=medCubit.stream.listen((medicineState)
    // {
    //   if(medicineState is AddItemEvent)
    //   {
    //     if(state.user.isNotEmpty)
    //     {
    //       return add(AddMedicineToUser(user: state.user,medList: medicineState.list));
    //       // add([...state.user.medicineList!, medicineState.list]);
    //     }
    //   }
    // });

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
    
    @override
    Future<void> close()
    {
      _userSubscription?.cancel();
      return super.close();
    }
    
  }

  
  get getUser
  {
    return state.user;
  }

}
