import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ignitesol_demo/const/image_const.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            ImageConst.pattern,
            height: MediaQuery.sizeOf(context).height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
