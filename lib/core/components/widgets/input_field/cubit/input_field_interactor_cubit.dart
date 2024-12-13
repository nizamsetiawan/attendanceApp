import 'package:bloc/bloc.dart';
part 'input_field_interactor_state.dart';

class InputFieldInteractorCubit extends Cubit<InputFieldInteractorState> {
  InputFieldInteractorCubit() : super(InputFieldInteractorState());

  void initital({
    required bool hasFocus,
    required bool isTextEmpty,
    required bool? obscureText,
  }) {
    emit(
      state.copyWith(
        hasFocus: hasFocus,
        isTextEmpty: isTextEmpty,
        obscureText:obscureText,
      ),
    );
  }

  void changeFocusNodeStatus(bool hasFocus) {
    if (state.hasFocus == hasFocus) return;
    emit(state.copyWith(hasFocus: hasFocus));
  }

  void changeTextStatus(bool isTextEmpty) {
    if (state.isTextEmpty == isTextEmpty) return;

    emit(state.copyWith(isTextEmpty: isTextEmpty));
  }

  void changeObscureTextStatus(bool obscureText) {
    if (state.obscureText == obscureText) return;
    emit(state.copyWith(obscureText: obscureText));
  }
}
