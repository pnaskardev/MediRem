import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(index: 0));
  void changePage(int index) 
  {
    log('change page called $index');
    emit(NavigationState(index: index));
  }
}
