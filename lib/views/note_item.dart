import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/list_bloc.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, List<NoteModel>>(
      builder: (context, state) {
        final note = state[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Note(index: index)),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              elevation: 10,
              child: Container(
                height: 80,
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        note.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        note.description.split('\n')[0],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}