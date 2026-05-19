import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/local/cache_helper.dart';
import 'package:posty/core/theme/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isDark = false;
  void toggleTheme({bool? fromShared})
  {
    if (fromShared != null )
    {
      isDark = fromShared;
    }
    else
    {
      isDark= !isDark;
    }
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value)
    {
      emit(ThemeChangedState());
    });
  }




  ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C6FF7),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F4FB),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F4FB),
          foregroundColor: Color(0xFF2D2D3A),
          elevation: 0,
        ),
        useMaterial3: true,
      );
  }

  ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C6FF7),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E2E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      );
  }
}
