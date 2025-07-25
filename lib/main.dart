import 'package:flutter/material.dart';
import 'package:ignitesol_demo/presentation/category/category_screen.dart';
import 'package:ignitesol_demo/theme/app_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          home: CategoryScreen(),
        );
      },
    );
  }
}
