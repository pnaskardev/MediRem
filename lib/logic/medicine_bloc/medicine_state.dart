part of 'medicine_bloc.dart';

abstract class MedicineState extends Equatable 
{
  Medicine? medicine;
  MedicineState({this.medicine});
  
  @override
  List<Object> get props => [];
}

class MedicineInitial extends MedicineState {}
