import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementEvent {}

class IncrementBloc extends Bloc<IncrementEvent, int> {
  IncrementBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state+1));
  }
}