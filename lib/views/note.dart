import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';

class Note extends StatelessWidget {
  Note({super.key, required this.index});

  final int index;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void changeNoteTitle(String title) {
      BlocProvider.of<ListBloc>(context).add(
        ChangeNoteEvent(
          index,
          NoteModel(
            title: title,
            description: _descriptionController.text,
          ),
        ),
      );
    }

    void addNoteTitle(String title) {
      BlocProvider.of<ListBloc>(context).add(
        AddNoteEvent(
          NoteModel(
            title: title,
            description: '',
          ),
        ),
      );
    }

    void changeNoteDescription(String description) {
      BlocProvider.of<ListBloc>(context).add(
        ChangeNoteEvent(
          index,
          NoteModel(
            title: _titleController.text,
            description: description,
          ),
        ),
      );
    }

    void addNoteDescription(String description) {
      BlocProvider.of<ListBloc>(context).add(
        AddNoteEvent(
          NoteModel(
            title: '',
            description: description,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<ListBloc>(context).add(DeleteNoteEvent(index));
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ListBloc, List<NoteModel>>(
          builder: (context, state) {

            if (index == state.length) {
              _titleController.text = '';
              _descriptionController.text = '';
            } else {
              final note = state[index];
              // _titleController.text = note.title;
              // _descriptionController.text = note.description;
              _titleController.value = TextEditingValue(
                text: note.title,
                selection: TextSelection.collapsed(offset: note.title.length),
              );
              _descriptionController.value = TextEditingValue(
                text: note.description,
                selection: TextSelection.collapsed(offset: note.description.length),
              );
            }

            return ListView(
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  onChanged: (title) {
                    if (index == state.length) {
                      return addNoteTitle(title);
                    } else {
                      return changeNoteTitle(title);
                    }
                  },
                ),
                TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Text...',
                    border: InputBorder.none,
                  ),
                  onChanged: (description) {
                    if (index == state.length) {
                      return addNoteDescription(description);
                    } else {
                      return changeNoteDescription(description);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}