import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ignitesol_demo/const/color_const.dart';
import 'package:ignitesol_demo/const/image_const.dart';
import 'package:ignitesol_demo/presentation/books/book_screen.dart';

class CategoryTile extends StatelessWidget {
    final String iconAsset;
  final String title;
  final VoidCallback? onTap;
  final bool isWeb;
  const CategoryTile({
    super.key,
    required this.iconAsset,
    required this.title,
    this.onTap,
    this.isWeb = false,
  });



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen(topic: title,)));
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: 50,
        width: isWeb ? 450 : null,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: const Color(0xFFD3D1EE).withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconAsset, height: 24, width: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title.toUpperCase(),
                style:  theme.textTheme.titleLarge?.copyWith(
                  color: ColorConst.darkGrey,
                  fontWeight: FontWeight.w600,
                ) 
              ),
            ),
            SvgPicture.asset(ImageConst.next),
          ],
        ),
      ),
    );
  }
}
