part of 'medicine_cubit.dart';

class MedicineState extends Equatable 
{
  final List<Medicine> list;
  MedicineState({required this.list});
  @override
  List<Object> get props => [];
}

class MedicineInitial extends MedicineState 
{
  final List<Medicine> list;
  @override
  MedicineInitial({required this.list}):super(list: list);
}

class MedicineUpdated extends MedicineState 
{
  final List<Medicine> list;

  MedicineUpdated({required this.list}) : super(list: list);
}


class AddItemEvent extends MedicineState 
{
  final List<Medicine> list;

  AddItemEvent({required this.list}):super(list: list);

  @override
  List<Object> get props => [list];
}

