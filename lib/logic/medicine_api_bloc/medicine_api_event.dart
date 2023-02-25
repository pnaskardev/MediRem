part of 'medicine_api_bloc.dart';

abstract class MedicineApiEvent extends Equatable
 {
  const MedicineApiEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicineListEvent extends MedicineApiEvent
{
  @override
  List<Object> get props => [];
}
