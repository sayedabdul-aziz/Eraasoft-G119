import 'package:counter_with_cubit/bloc/bloc/counter_bloc.dart';
import 'package:counter_with_cubit/bloc/bloc/counter_event.dart';
import 'package:counter_with_cubit/bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Counter App'),
          ),
          body: BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
            if (state is UpdateCounterState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Counter Updated'),
                ),
              );
            }
          }, builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<CounterBloc>().counter.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        onPressed: () {
                          context.read<CounterBloc>().add(RemoveCounterEvent());
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        onPressed: () {
                          context.read<CounterBloc>().add(AddCounterEvent());
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }
}
