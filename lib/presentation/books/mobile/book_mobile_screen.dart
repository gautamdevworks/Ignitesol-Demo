import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ignitesol_demo/const/color_const.dart';
import 'package:ignitesol_demo/const/image_const.dart';
import 'package:ignitesol_demo/presentation/books/bloc/book_bloc.dart';
import 'package:ignitesol_demo/presentation/books/widget/book_card.dart';
import 'package:ignitesol_demo/presentation/books/widget/custom_search_textfield.dart';

class BookMobileScreen extends StatelessWidget {
  const BookMobileScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return Scaffold(
          body: state is BookLoading ? Center(child: CircularProgressIndicator()) : Column(
            children: [
              Container(
                height: 170,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                padding: EdgeInsets.only(top: 80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(ImageConst.back),
                          ),
                          SizedBox(width: 10),
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge
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
              ),
              SizedBox(height: 15),

               Expanded(
                 child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                   child: Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          alignment: WrapAlignment.start,
                          children: [
                            if (state is BookLoaded)
                              for (final book in state.books)
                                if (book.coverUrl != null &&
                                    book.coverUrl!.isNotEmpty)
                                  GestureDetector(
                                    onTap: () {},
                                    child: BookCard(
                                      width: MediaQuery.sizeOf(context).width * 0.27,
                                      imageUrl: book.coverUrl ?? '',
                                      title: book.title,
                                      urlLink: book.formats['text/html'] ?? '',
                                      author: book.authors.isNotEmpty
                                          ? book.authors.first.name
                                          : 'Unknown',
                                    ),
                                  ),
                          ],
                        ),
                 ),
               ),
                 
            ],
          ),
        );
      },
    );
  }
}
