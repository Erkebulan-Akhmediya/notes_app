import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ListBloc, List<NoteModel>>(
          builder: (context, state) {
            return Text(
              state[index].title,
              style: const TextStyle(
                fontSize: 25,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ListBloc, List<NoteModel>>(
          builder: (context, state) {
            return Text(
              state[index].description,
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}