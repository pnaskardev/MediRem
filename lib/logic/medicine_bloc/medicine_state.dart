part of 'medicine_bloc.dart';

class MedicineState extends Equatable 
{
  final List<Medicine> list;
  const MedicineState({required this.list});
  @override
  List<Object> get props => [];
}

class MedicineInitial extends MedicineState 
{
  final List<Medicine> list;
  @override
  const MedicineInitial({required this.list}):super(list: list);
}

class MedicineUpdated extends MedicineState 
{
  final List<Medicine> items;

  const MedicineUpdated({required this.items}) : super(list: items);
}


