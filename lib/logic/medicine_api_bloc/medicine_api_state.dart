part of 'medicine_api_bloc.dart';

abstract class MedicineApiState extends Equatable 
{
  // const MedicineApiState();
  
  // @override
  // List<Object> get props => [];
}
// class MedicineApiInitial extends MedicineApiState {}
class MedicineApiLoadingState extends MedicineApiState
{
   @override
  List<Object> get props => [];
}

class MedicineApiLoadedState extends MedicineApiState
{
  final List<ApiMedicines> medicineList;
  MedicineApiLoadedState({required this.medicineList});
   @override
  List<Object> get props => [medicineList];
}

class MedicineApiErrorState extends MedicineApiState
{
  final String error;
  MedicineApiErrorState({required this.error});
   @override
  List<Object> get props => [error];
}


