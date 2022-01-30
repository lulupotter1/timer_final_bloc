import 'package:timer_final_bloc/utils/template.dart';

var lightThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.red,
      titleTextStyle: ThemeTextRegular.size24),
  primaryColor: ThemeColors.red,
);

var darkThemeData = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.white,
      titleTextStyle:
          ThemeTextRegular.size24.copyWith(color: ThemeColors.white)),
  brightness: Brightness.dark,
);
