part of 'add_notes_bloc.dart';

@freezed
class AddNotesEvent with _$AddNotesEvent {
  const factory AddNotesEvent.started() = _Started;
  const factory AddNotesEvent.addNotes({
    required String title,
    required String note,
}) = _AddNotes;
}
