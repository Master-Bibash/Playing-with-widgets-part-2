import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Pagination/Model/model.dart';
import 'package:flutter_application_1/screens/Pagination/cubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostsView extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PostsCubit, PostState>(builder: (context, state) {
      if (state is PostLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<Post> posts = [];
      bool isLoading = false;

      if (state is PostLoading) {
        posts = state.oldPost;
        isLoading = true;
      } else if (state is PostLoaded) {
        posts = state.post;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length)
            return _post(posts[index], context);
          else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _post(Post post, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${post.id}. ${post.title}",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(post.body)
        ],
      ),
    );
  }
}
