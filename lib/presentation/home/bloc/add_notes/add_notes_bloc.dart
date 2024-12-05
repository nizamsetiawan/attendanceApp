import 'package:bloc/bloc.dart';
import 'package:facedivi/data/datasources/notes_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_notes_event.dart';
part 'add_notes_state.dart';
part 'add_notes_bloc.freezed.dart';

class AddNotesBloc extends Bloc<AddNotesEvent, AddNotesState> {
  final NotesRemoteDatasource datasource;
  AddNotesBloc(this.datasource) : super(const _Initial()) {
    on<_AddNotes>((event, emit) async {
     emit(const _Loading());
     final result = await datasource.addNotes(event.title, event.note);
     result.fold(
           (l) => emit(_Error(l)),
           (r) => emit(const _Success()),
     );
    });
  }
}
