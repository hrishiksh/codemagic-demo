import 'dart:convert';

import 'package:codemagicdemo/src/data/author.dart';
import 'package:http/http.dart' as http;
import './author_list.dart';

class NetworkService {
  final String baseurl = "https://quotable.io";
  final String imageBaseUrl = "https://images.quotable.dev/profile/400/";

  String authorImageLink({required String slug}) {
    return "$imageBaseUrl$slug.jpg";
  }

  Future<AuthorList> fetchAuthorList() async {
    http.Response response = await http.get(
      Uri.parse("$baseurl/authors"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResult = jsonDecode(response.body);
      return AuthorList(
        count: decodedResult["count"],
        totalCount: decodedResult["totalCount"],
        page: decodedResult["page"],
        totalPage: decodedResult["totalPages"],
        results: (decodedResult["results"] as List)
            .map(
              (e) => Author(
                id: e["_id"],
                name: e["name"],
                slug: e["slug"],
                bio: e["bio"],
                description: e["description"],
                quoteCount: e["quoteCount"],
                link: e["link"],
                dateAdded: e["dateAdded"],
                dateModified: e["dateModified"],
              ),
            )
            .toList(),
      );
    } else {
      throw Exception("Failed to load Author list");
    }
  }
}
