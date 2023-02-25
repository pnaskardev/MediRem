import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/repository/api_repository.dart';

part 'medicine_api_event.dart';
part 'medicine_api_state.dart';

class MedicineApiBloc extends Bloc<MedicineApiEvent, MedicineApiState> 
{
  final ApiRepository? _apiRepository;
  MedicineApiBloc({apiRepository}) :_apiRepository=apiRepository, super(MedicineApiLoadingState()) 
  {
    on<LoadMedicineListEvent>((event, emit) async
    {
      emit(MedicineApiLoadingState());
      log('first state emitted');
      try 
      {

        
      } 
      catch (e) 
      {
        
      }
      emit(MedicineApiLoadedState());
    });
  }
}
