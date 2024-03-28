import 'dart:convert';
import 'package:flutter_application_1/screens/Pagination/Model/model.dart';
import 'package:http/http.dart';

class PostsService {
  static const FETCH_LIMIT = 15;
  final baseUrl = "https://jsonplaceholder.typicode.com/posts";

Future<List<Post>> fetchPosts(int page) async {
    try {
      final response =
          await get(Uri.parse(baseUrl + "?_limit=$FETCH_LIMIT&_page=$page"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)
            .map<Post>((e) => Post.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      // Handle error, log or rethrow if necessary
      print('Error fetching posts: $e');
      throw e; // Rethrow the exception to propagate it to the caller
    }
  }

}
