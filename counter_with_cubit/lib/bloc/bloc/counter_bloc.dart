import 'package:counter_with_cubit/bloc/bloc/counter_event.dart';
import 'package:counter_with_cubit/bloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitialState()) {
    // on<CounterEvent>((event, emit) {
    //   if (event is AddCounterEvent) {
    //     addCounter(emit);
    //   } else if (event is RemoveCounterEvent) {
    //     removeCounter(emit);
    //   }
    // });
    on<AddCounterEvent>(addCounter);
    on<RemoveCounterEvent>(removeCounter);
  }

  addCounter(AddCounterEvent event, Emitter<CounterState> emit) {
    counter++;
    emit(UpdateCounterState());
  }

  removeCounter(RemoveCounterEvent event, Emitter<CounterState> emit) {
    counter--;
    emit(UpdateCounterState());
  }
}
