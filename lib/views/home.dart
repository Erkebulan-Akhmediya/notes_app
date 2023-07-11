import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: BlocBuilder<ListBloc, List<NoteModel>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final note = state[index];
                return ListTile(
                  title: Text(note.title),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}