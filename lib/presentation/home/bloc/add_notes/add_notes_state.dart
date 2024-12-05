part of 'add_notes_bloc.dart';

@freezed
class AddNotesState with _$AddNotesState {
  const factory AddNotesState.initial() = _Initial;
  const factory AddNotesState.loading() = _Loading;
  const factory AddNotesState.success() = _Success;
  const factory AddNotesState.error(String message) = _Error;
}
