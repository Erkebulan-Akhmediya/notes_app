import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNoteEvent {
  AddNoteEvent(this.note);

  final NoteModel note;
}

class ListBloc extends Bloc<AddNoteEvent, List<NoteModel>> {
  ListBloc() : super([]) {

    Stream<List<NoteModel>> fetchNotes() async* {
      final prefs = await SharedPreferences.getInstance();
      final stringList = prefs.getStringList('notes') ?? [];

      // converting a list of string into a list of note models
      List<NoteModel> noteModelList = List.from(
        stringList.map(
          (e) {
            final noteMap = json.decode(e);
            final note = NoteModel.fromMap(noteMap);
            return note;
          },
        ),
      );

      yield noteModelList;
    }
    fetchNotes();

    on<AddNoteEvent>((event, emit) async {
      // adding new note to local storage
      final prefs = await SharedPreferences.getInstance();
      final oldNotes = prefs.getStringList('notes') ?? [];
      oldNotes.add(json.encode(event.note.toMap()));
      prefs.setStringList('notes', oldNotes);

      // converting a list of string into a list of note models
      List<NoteModel> newNotes = List.from(
        oldNotes.map(
          (e) {
            final noteMap = json.decode(e);
            final note = NoteModel.fromMap(noteMap);
            return note;
          },
        ),
      );

      emit(newNotes);
    });
  }
}