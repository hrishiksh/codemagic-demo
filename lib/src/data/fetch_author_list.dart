import 'dart:convert';

import 'package:codemagicdemo/src/data/author.dart';
import 'package:http/http.dart' as http;
import './author_list.dart';

Future<AuthorList> fetchAuthorList() async {
  http.Response response = await http.get(
    Uri.parse("https://quotable.io/authors"),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedResult = jsonDecode(response.body);
    return AuthorList(
      count: decodedResult["count"],
      totalCount: decodedResult["totalCount"],
      page: decodedResult["page"],
      totalPage: decodedResult["totalPages"],
      results: (decodedResult["results"] as List)
          .map((e) => Author(
              id: e["_id"],
              name: e["name"],
              slug: e["slug"],
              bio: e["bio"],
              description: e["description"],
              quoteCount: e["quoteCount"],
              link: e["link"],
              dateAdded: e["dateAdded"],
              dateModified: e["dateModified"]))
          .toList(),
    );
  } else {
    throw Exception("Failed to load Author list");
  }
}
