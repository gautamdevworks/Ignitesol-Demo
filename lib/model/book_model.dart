class Book {
  final String title;
  final List<Author> authors;
  final String? coverUrl;
  final Map<String, String> formats;

  Book({
    required this.title,
    required this.authors,
    required this.coverUrl,
    required this.formats,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final formats = Map<String, String>.from(json['formats'] ?? {});
    final coverUrl = formats.entries.firstWhere(
      (e) => e.key.contains('image'),
      orElse: () => const MapEntry('', ''),
    ).value;

    return Book(
      title: json['title'],
      authors: (json['authors'] as List).map((a) => Author.fromJson(a)).toList(),
      coverUrl: coverUrl.isNotEmpty ? coverUrl : null,
      formats: formats,
    );
  }
}

class Author {
  final String name;

  Author({required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(name: json['name']);
  }
}
