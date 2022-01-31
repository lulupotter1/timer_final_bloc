import 'package:timer_final_bloc/utils/template.dart';

var lightThemeData = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: ThemeColors.red,
        titleTextStyle:
            ThemeTextRegular.size24.copyWith(color: ThemeColors.white)),
    brightness: Brightness.light,
    primaryColor: ThemeColors.red,
    textTheme: const TextTheme(button: ThemeTextRegular.size14),
    buttonTheme: const ButtonThemeData(
      buttonColor: ThemeColors.red,
      textTheme: ButtonTextTheme.primary,
    ));

var darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.white,
        titleTextStyle: ThemeTextRegular.size24),
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: ThemeColors.white,
      textTheme: ButtonTextTheme.primary,
    ));
