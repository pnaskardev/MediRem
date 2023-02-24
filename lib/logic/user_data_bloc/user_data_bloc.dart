import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/medicine.dart';
import 'package:medi_rem/models/user_data.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> 
{
  UserDataBloc() : super(const UserDataState()) 
  {
    on<UserDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
