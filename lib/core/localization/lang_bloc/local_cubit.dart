import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale, immutable;

import '../../../data/data.dart';

part 'local_states.dart';

class LocalCubit extends Cubit<LocalStates> {
  LocalCubit() : super(const SelectedLocale(Locale(AppSessionKeys.langKey)));

  void toArabic() {
    emit(const SelectedLocale(Locale('ar')));
  }

  void toEnglish() {
    emit(const SelectedLocale(Locale('en')));
  }
}
