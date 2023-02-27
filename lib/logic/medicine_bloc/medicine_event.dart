part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable 
{
  const MedicineEvent();

  @override
  List<Object> get props => [];
}

class AddItem extends MedicineEvent 
{
  final Medicine item;

  const AddItem({required this.item});
}

class RemoveItem extends MedicineEvent 
{
  final int index;

  const RemoveItem(this.index);
}
