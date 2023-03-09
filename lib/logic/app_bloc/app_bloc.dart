import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/logic/medicine_cubit/medicine_cubit.dart';
import 'package:medi_rem/models/medicine.dart';
import 'package:medi_rem/models/user_data.dart';
import 'package:medi_rem/repository/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> 
{

  List<Medicine>? medList;
  final AuthRepository _authRepository;
  final MedicineCubit _medicineCubit;
  StreamSubscription<UserData?>? _userSubscription;
  StreamSubscription<MedicineState?>? medSubscription;

  AppBloc({required AuthRepository authRepository,required medCubit}):
  _authRepository=authRepository,
  _medicineCubit=medCubit,
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

    // medSubscription=_medicineCubit.stream.listen((medicineState)
    // {
    //   if(medicineState is MedicineUpdated)
    //   {
    //     if(state.user.isNotEmpty)
    //     {
    //       log('Medicine added to the cubit');
    //       medList=medicineState.list;
    //       // add([...state.user.medicineList!, medicineState.list]);
    //       return add(AddMedicineToUser(user: state.user,medList: medicineState.list));
    //       // state.user.medicineList!=medicineState.list;
    //     }
    //   }
    // });

    // _medicineCubit.stream.listen((medicineState));

    on<AddMedicineToUser>((event, emit) 
    {
      emit
      (
        // event.user.isNotEmpty ? 
        // AppState.authenticated(event.user)
        // :
        // const AppState.unauthenticated()
        // event.user.isNotEmpty ?
        AppState.medicineChanged
        (
          UserData
          (
            uid: state.user.uid,
            email: state.user.email,
            medicineList: [...state.user.medicineList!,...medList!]
          )
        )
      );
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


