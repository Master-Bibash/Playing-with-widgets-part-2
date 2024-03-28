import 'package:flutter_application_1/screens/Pagination/Model/model.dart';
import 'package:flutter_application_1/screens/Pagination/Services/Post_services.dart';

class PostsRepository {
  final PostsService service;

  PostsRepository(this.service);

  Future<List<Post>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts; // Assuming fetchPosts already returns List<Post>
  }
}
