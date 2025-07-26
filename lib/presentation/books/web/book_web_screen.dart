import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ignitesol_demo/const/color_const.dart';
import 'package:ignitesol_demo/const/image_const.dart';
import 'package:ignitesol_demo/presentation/books/bloc/book_bloc.dart';
import 'package:ignitesol_demo/presentation/books/widget/book_card.dart';
import 'package:ignitesol_demo/presentation/books/widget/custom_search_textfield.dart';

class BookWebScreen extends StatelessWidget {
  const BookWebScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return Scaffold(
          body: state is BookLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 100),
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SvgPicture.asset(
                                          ImageConst.back,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: ColorConst.primary,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  CustomSearchBox(
                                    controller: TextEditingController(),
                                    onChanged: (value) {
                                      context.read<BookBloc>().add(
                                        FetchBooks(
                                          topic: title,
                                          searchQuery: value,
                                          nextUrl: '',
                                          showLoading: false,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                if (state is BookLoaded)
                                  for (final book in state.books)
                                    if (book.coverUrl != null &&
                                        book.coverUrl!.isNotEmpty)
                                      BookCard(
                                        imageUrl: book.coverUrl ?? '',
                                        title: book.title,
                                        author: book.authors.isNotEmpty
                                            ? book.authors.first.name
                                            : 'Unknown',
                                        urlLink:
                                            book.formats['text/html'] ?? '',
                                      ),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
