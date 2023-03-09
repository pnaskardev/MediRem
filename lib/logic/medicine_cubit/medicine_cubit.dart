import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/medicine.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> 
{

  MedicineCubit() : super( MedicineInitial(list: []));


  // Stream<MedicineState> mapToEventState(MedicineEvent event) async*
  //   {
  //     if (event is AddItem) 
  //     {
  //       items.add(event.item);
  //       yield MedicineUpdated(items);
  //     }
  //   }

  // Add an item to the list
  void addItem(Medicine item) 
  {
    final updatedItems = List<Medicine>.from(state.list)..add(item);
    emit(MedicineUpdated(list: updatedItems));
  }

}
