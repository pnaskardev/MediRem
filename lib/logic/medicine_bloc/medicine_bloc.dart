import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/medicine.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> 
{
  List<Medicine> items=[];

  MedicineBloc() : super(const MedicineInitial(list: [])) 
  {
    // on<MedicineEvent>((event, emit) 
    // {

    // });
    on<AddItem>((event, emit) 
    {
      items.add(event.item);
      emit(MedicineUpdated(items: items));
    });
    // Stream<MedicineState> mapToEventState(MedicineEvent event) async*
    // {
    //   if (event is AddItem) 
    //   {
    //     items.add(event.item);
    //     yield MedicineUpdated(items);
    //   }
    // }
  }
}
