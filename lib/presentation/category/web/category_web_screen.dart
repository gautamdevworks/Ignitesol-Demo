import 'package:flutter/material.dart';
import 'package:ignitesol_demo/const/color_const.dart';
import 'package:ignitesol_demo/const/image_const.dart';
import 'package:ignitesol_demo/const/string_const.dart';
import 'package:ignitesol_demo/presentation/category/widgets/category_header.dart';
import 'package:ignitesol_demo/presentation/category/widgets/category_tile.dart';

class CategoryWebScreen extends StatelessWidget {
  const CategoryWebScreen({super.key});

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
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 4,
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
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ).copyWith(top: 30),
                  child: Wrap(
                    spacing: 100,
                    runSpacing: 30,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    children: [
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.fiction,
                        title: StringConst.fiction,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.philosophy,
                        title: StringConst.philosophy,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.drama,
                        title: StringConst.drama,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.history,
                        title: StringConst.history,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.humour,
                        title: StringConst.humour,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.adventure,
                        title: StringConst.adventure,
                      ),
                      CategoryTile(
                        isWeb: true,
                        iconAsset: ImageConst.politics,
                        title: StringConst.politics,
                      ),
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
