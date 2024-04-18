import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Pagination/Model/model.dart';
import 'package:flutter_application_1/screens/Pagination/Repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostsCubit extends Cubit<PostState> {
  PostsCubit(this.reposotory) : super(PostInitial());
  int page = 1;
  final PostsRepository reposotory;
  void loadPosts() {
    if (state is PostLoading) return;
    final currentState = state;
    var oldPosts = <Post>[];
    if (currentState is PostLoaded) {
      oldPosts = currentState.post;
    }
    emit(PostLoading(oldPosts, isFirstFetch: page == 1));
    reposotory.fetchPosts(page).then(
      (newPost) {
        final posts = (state as PostLoading).oldPost;
        posts.addAll(newPost);
        page++;
        emit(PostLoaded(posts)); // Emit PostLoaded state with updated posts
      },
    ).catchError((error) {
      return Text("error: " + error);
    });
  }
}
