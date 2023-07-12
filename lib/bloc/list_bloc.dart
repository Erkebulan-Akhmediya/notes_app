import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NoteEvent {}
class AddNoteEvent extends NoteEvent {
  final NoteModel note;
  AddNoteEvent(this.note);
}
class ReadNoteEvent extends NoteEvent {}
class ChangeNoteEvent extends NoteEvent {
  final int index;
  final NoteModel note;
  ChangeNoteEvent(this.index, this.note);
}

class ListBloc extends Bloc<NoteEvent, List<NoteModel>> {

  List<NoteModel> stringListToNoteModelList(List<String> stringList) =>
    List.from(
      stringList.map(
        (e) => NoteModel.fromMap(
          json.decode(e),
        ),
      ),
    );

  Future<List<String>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('notes') ?? [];
  }

  ListBloc() : super([]) {

    on<ReadNoteEvent>((event, emit) async {
      List<String> stringList = await getNotes();
      emit(stringListToNoteModelList(stringList));
    });

    on<AddNoteEvent>((event, emit) async {
      final notes = await getNotes();
      notes.add(json.encode(event.note.toMap()));

      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('notes', notes);

      emit(stringListToNoteModelList(notes));
    });

    on<ChangeNoteEvent>((event, emit) async {
      List<String> notes = await getNotes();
      notes[event.index] = json.encode(event.note.toMap());

      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('notes', notes);

      emit(stringListToNoteModelList(notes));
    });
  }
}