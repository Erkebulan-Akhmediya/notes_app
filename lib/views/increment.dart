import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/increment_bloc.dart';

class Increment extends StatelessWidget {
  const Increment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<IncrementBloc>(context).add(IncrementEvent());
          },
          child: const Text('Increment'),
        ),
      ),
    );
  }

}