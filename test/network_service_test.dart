import 'package:codemagicdemo/src/data/author.dart';
import 'package:codemagicdemo/src/data/author_list.dart';
import 'package:codemagicdemo/src/data/network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  AuthorList authorList = const AuthorList(
    count: 20,
    totalCount: 700,
    page: 1,
    totalPage: 35,
    results: [
      Author(
          id: "yBDYq_Vtnuw",
          name: "A. A. Milne",
          slug: "a-a-milne",
          bio:
              "Alan Alexander Milne (18 January 1882 31 January 1956) was an English author, best known for his",
          description: "British author",
          quoteCount: 2,
          link: "https://en.wikipedia.org/wiki/A._A._Milne",
          dateAdded: "2019-08-08",
          dateModified: "2019-08-08")
    ],
  );

  late MockNetworkService mockservice;

  setUp(() {
    mockservice = MockNetworkService();
  });

  group("test http call to the network", () {
    test("Test if fetch author function is invoked", () {
      when(() => mockservice.fetchAuthorList())
          .thenAnswer((_) async => authorList);
      verifyNever(() => mockservice.fetchAuthorList());
      mockservice.fetchAuthorList();
      verify(() => mockservice.fetchAuthorList()).called(1);
    });
  });

  test("Test to see if fetch author list returns", () async {
    when(() => mockservice.fetchAuthorList())
        .thenAnswer((_) async => authorList);
    AuthorList actualAuthorList = await mockservice.fetchAuthorList();
    expect(actualAuthorList, authorList);
  });

  test("If author image link is reachable", () {
    when(() => mockservice.authorImageLink(slug: "a-a-milne"))
        .thenReturn("https://images.quotable.dev/profile/400/a-a-milne.jpg");

    expect(mockservice.authorImageLink(slug: "a-a-milne"),
        "https://images.quotable.dev/profile/400/a-a-milne.jpg");
  });
}
