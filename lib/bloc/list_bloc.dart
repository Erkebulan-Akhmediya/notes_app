import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/model/note_model.dart';

class AddNoteEvent {
  AddNoteEvent(this.note);

  final NoteModel note;
}

class ListBloc extends Bloc<AddNoteEvent, List<NoteModel>> {
  ListBloc() : super([]) {
    on<AddNoteEvent>((event, emit) {
      List<NoteModel> notes = List.from(state)..add(event.note);
      emit(notes);
    });
  }
}