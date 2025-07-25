import 'package:flutter/material.dart';
import 'package:ignitesol_demo/presentation/category/mobile/category_mobile_screen.dart';
import 'package:ignitesol_demo/presentation/category/web/category_web_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => CategoryMobileScreen(),
      tablet: (BuildContext context) => CategoryWebScreen(),
      desktop: (BuildContext context) => CategoryWebScreen(),
      watch: (BuildContext context) => CategoryWebScreen(),
    );
  }
}
