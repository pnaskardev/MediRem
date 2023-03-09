part of 'medicine_api_bloc.dart';

abstract class MedicineApiEvent extends Equatable
 {
  const MedicineApiEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicineListEvent extends MedicineApiEvent
{
  String query;
  LoadMedicineListEvent({required this.query});
  @override
  List<Object> get props => [query];
}
