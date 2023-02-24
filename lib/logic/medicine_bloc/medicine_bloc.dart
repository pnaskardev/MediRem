import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/medicine.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineInitial()) 
  {
    on<MedicineEvent>((event, emit) 
    {
    });
  }
}
