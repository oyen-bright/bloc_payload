import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  changeTeme(int rand) {
    if (rand.isEven) {
      emit(state.copyWith(appTheme: AppTheme.light));
      return "Light";
    } else {
      emit(state.copyWith(appTheme: AppTheme.dark));
      return "Dark";
    }
  }
}
