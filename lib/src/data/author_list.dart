import './author.dart';

class AuthorList {
  final int count;
  final int totalCount;
  final int page;
  final int totalPage;
  final List<Author> results;

  const AuthorList({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPage,
    required this.results,
  });
}
