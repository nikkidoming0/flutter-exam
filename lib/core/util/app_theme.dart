import 'dart:ui';

class AppTheme {
  static ThemeModel determineThemeByName(String name) {
    switch (name.toLowerCase()) {
      case "youtube":
        return const ThemeModel(
          primary: Color(0xffF44336),
          secondary: Color(0xffD32F2F),
        );
      case "spotify":
        return const ThemeModel(
          primary: Color(0xff4CAF50),
          secondary: Color(0xff388E3C),
        );
      case "facebook":
        return const ThemeModel(
          primary: Color(0xff2196F3),
          secondary: Color(0xff1976D2),
        );
      default:
        return const ThemeModel(
          primary: Color(0xffFEBF03),
          secondary: Color(0xffFBC02D),
        );
    }
  }
}

class ThemeModel {
  final Color primary;
  final Color secondary;

  const ThemeModel({
    required this.primary,
    required this.secondary,
  });
}