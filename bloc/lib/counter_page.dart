
import 'package:blocs/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
// BlocBuilder:it rebuld the all thing
//       body: BlocBuilder<CounterCubit, int>(
//         builder: (context, count) => Center(child: Text('$count')),
//       ),

//BlocSelector:this only the state rebuild

        //  body:  BlocSelector<CounterCubit, int, int>(
        //   selector: (state) => state, 
        //   builder: (context, count) {
        //     return Text(
        //       '$count',
        //       style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        //     );
        //   },
        // ),
     // I want to do something once when state changes, but I don’t need to rebuild UI.
           body: BlocListener<CounterCubit, int>(
        listenWhen: (previous, current) => current % 5 == 0, 
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Counter reached $state!')),
          );
        },
                child: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Text(
                '$count',
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}



      