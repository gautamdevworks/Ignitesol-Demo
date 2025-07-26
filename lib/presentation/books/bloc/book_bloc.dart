import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/book_model.dart';
import '../../../services/api_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final ApiService apiService;

  BookBloc({ApiService? apiService})
      : apiService = apiService ?? ApiService(),
        super(BookInitial()) {
    on<FetchBooks>(_onFetchBooks);
  }

  Future<void> _onFetchBooks(
    FetchBooks event,
    Emitter<BookState> emit,
  ) async {
    if (event.showLoading) {
      emit(BookLoading());
    }
    try {
      final books = await apiService.fetchBooks(
        topic: event.topic,
        searchQuery: event.searchQuery,
        nextUrl: event.nextUrl,
      );
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
} 