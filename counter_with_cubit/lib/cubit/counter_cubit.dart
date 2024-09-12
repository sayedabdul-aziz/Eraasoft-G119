import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;

  add() {
    counter++;
    emit(CounterInitialState());
  }

  remove() {
    counter--;
    emit(UpdateCounterState());
  }
}
