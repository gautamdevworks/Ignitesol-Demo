import 'package:flutter/material.dart';
import 'package:ignitesol_demo/const/color_const.dart';
import 'package:ignitesol_demo/const/image_const.dart';
import 'package:ignitesol_demo/const/string_const.dart';
import 'package:ignitesol_demo/presentation/category/widgets/category_header.dart';
import 'package:ignitesol_demo/presentation/category/widgets/category_tile.dart';

class CategoryMobileScreen extends StatelessWidget {
  const CategoryMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryHeader(
              child: Positioned(
                top: MediaQuery.sizeOf(context).height * 0.1,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConst.gutenbergProject,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              color: ColorConst.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        StringConst.aSocialCatalogingWebsite,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ).copyWith(top: 30),
                  child: Column(
                    children: [
                      CategoryTile(
                        iconAsset: ImageConst.fiction,
                        title: StringConst.fiction,
                      ),
                      SizedBox(height: 30),

                      CategoryTile(
                        iconAsset: ImageConst.philosophy,
                        title: StringConst.philosophy,
                      ),
                      SizedBox(height: 30),
                      CategoryTile(
                        iconAsset: ImageConst.drama,
                        title: StringConst.drama,
                      ),
                      SizedBox(height: 30),
                      CategoryTile(
                        iconAsset: ImageConst.history,
                        title: StringConst.history,
                      ),
                      SizedBox(height: 30),
                      CategoryTile(
                        iconAsset: ImageConst.humour,
                        title: StringConst.humour,
                      ),
                      SizedBox(height: 30),
                      CategoryTile(
                        iconAsset: ImageConst.adventure,
                        title: StringConst.adventure,
                      ),
                      SizedBox(height: 30),
                      CategoryTile(
                        iconAsset: ImageConst.politics,
                        title: StringConst.politics,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
