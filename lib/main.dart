import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/increment_bloc.dart';
import 'package:notes_app/views/increment.dart';
import 'package:notes_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncrementBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        routes: {
          '/add': (context) => const Increment(),
        },
      ),
    );
  }

}