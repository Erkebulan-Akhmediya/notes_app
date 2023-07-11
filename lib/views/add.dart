import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';

class Add extends StatelessWidget {
  Add({super.key});

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ListBloc>(context).add(
                  AddNoteEvent(
                    NoteModel(
                      title: _titleController.text,
                    ),
                  ),
                );
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }

}