import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/note.dart';
import 'package:notes_app/views/note_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListBloc>(context).add(ReadNoteEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Text('Notes'),
        ),
      ),
      body: Center(
        child: BlocBuilder<ListBloc, List<NoteModel>>(
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: state.length,
              itemBuilder: (context, index) {
                return NoteItem(index: index);
              },
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<ListBloc, List<NoteModel>>(
        builder: (context, state) {
          return ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.grey),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Note(index: state.length),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

}