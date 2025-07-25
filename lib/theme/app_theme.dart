import 'package:flutter/material.dart';
import 'package:ignitesol_demo/const/color_const.dart';

/// Central place to keep the light & dark themes for the application.
///
/// The themes set `fontFamily` to "Montserrat" (make sure the font
/// is declared in `pubspec.yaml` under flutter/fonts and the TTF files
/// are included inside the `fonts/` folder).
class AppTheme {
  AppTheme._(); // Prevent instantiation

  // ---------------------------------------------------------------------------
  //  Common Colors
  // ---------------------------------------------------------------------------
  static const Color _primaryColor = Color(0xFF0A73FF);
  static const Color _secondaryColor = Color(0xFF0066E5);
  static const String _fontFamily = 'Montserrat';

  // ---------------------------------------------------------------------------
  //  Light Theme
  // ---------------------------------------------------------------------------
  static final ThemeData light = _baseTheme(Brightness.light).copyWith(
    scaffoldBackgroundColor:  ColorConst.secondary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );

  // ---------------------------------------------------------------------------
  //  Dark Theme
  // ---------------------------------------------------------------------------
  static final ThemeData dark = _baseTheme(Brightness.dark).copyWith(
    scaffoldBackgroundColor: ColorConst.secondary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );

  // ---------------------------------------------------------------------------
  //  Private helpers
  // ---------------------------------------------------------------------------
  static ThemeData _baseTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final Color primary = _primaryColor;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
      ).copyWith(secondary: _secondaryColor),
      fontFamily: _fontFamily,
      textTheme: _textTheme(isLight ? Colors.black87 : Colors.white70),
    );
  }

  static TextTheme _textTheme(Color baseColor) {
    return TextTheme(
      displayLarge: _headlineStyle(baseColor, 57, FontWeight.bold),
      displayMedium: _headlineStyle(baseColor, 45, FontWeight.bold),
      displaySmall: _headlineStyle(baseColor, 36, FontWeight.bold),
      headlineLarge: _headlineStyle(baseColor, 32, FontWeight.w700),
      headlineMedium: _headlineStyle(baseColor, 28, FontWeight.w700),
      titleLarge: _headlineStyle(baseColor, 22, FontWeight.w600),
      titleMedium: _headlineStyle(baseColor, 16, FontWeight.w600),
      titleSmall: _headlineStyle(baseColor, 14, FontWeight.w500),
      bodyLarge: _bodyStyle(baseColor, 16),
      bodyMedium: _bodyStyle(baseColor, 14),
      bodySmall: _bodyStyle(baseColor, 12),
      labelLarge: _bodyStyle(baseColor, 14, FontWeight.w500),
      labelMedium: _bodyStyle(baseColor, 12, FontWeight.w500),
      labelSmall: _bodyStyle(baseColor, 11, FontWeight.w500),
    );
  }

  static TextStyle _headlineStyle(Color color, double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.2,
    );
  }

  static TextStyle _bodyStyle(Color color, double size, [FontWeight weight = FontWeight.w400]) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.4,
    );
  }
} 