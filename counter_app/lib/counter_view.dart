import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.restore)),
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      child: const Icon(Icons.remove)),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ));
  }
}
