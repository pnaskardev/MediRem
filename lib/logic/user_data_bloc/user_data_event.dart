part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class AddMedicine extends UserDataEvent 
{
  
  final Medicine medicine;
  const AddMedicine({required this.medicine});
}

class RemoveMedicine extends UserDataEvent {
  final Medicine medicine;

  const RemoveMedicine({required this.medicine});
}
