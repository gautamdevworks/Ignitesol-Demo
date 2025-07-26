import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ignitesol_demo/presentation/books/bloc/book_bloc.dart';
import 'package:ignitesol_demo/presentation/books/mobile/book_mobile_screen.dart';
import 'package:ignitesol_demo/presentation/books/web/book_web_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookScreen extends StatelessWidget {
  final String topic;

  const BookScreen({super.key, required this.topic,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc()..add(FetchBooks(topic: topic, searchQuery: '', nextUrl: '',showLoading: true)),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => BookMobileScreen(title: topic,),
        tablet: (BuildContext context) => BookWebScreen(title: topic,),
        desktop: (BuildContext context) => BookWebScreen(title: topic,),
        watch: (BuildContext context) => BookWebScreen(title: topic,),
      ),
    );
  }
}
