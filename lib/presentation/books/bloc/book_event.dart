part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class FetchBooks extends BookEvent {
  final String topic;
  final String? searchQuery;
  final String? nextUrl;
  final bool showLoading;

  const FetchBooks({
    required this.topic,
    this.searchQuery,
    this.nextUrl,
    this.showLoading = false,
  });

  @override
  List<Object?> get props => [topic, searchQuery, nextUrl, showLoading];
} 