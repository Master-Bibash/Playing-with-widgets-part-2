import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Pagination/Repository/post_repository.dart';
import 'package:flutter_application_1/screens/Pagination/Screens/Post_screen.dart';
import 'package:flutter_application_1/screens/Pagination/Services/Post_services.dart';
import 'package:flutter_application_1/screens/Pagination/cubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  return runApp(PaginationApp(
    repository: PostsRepository(PostsService()),
  ));
}

class PaginationApp extends StatelessWidget {
  const PaginationApp({super.key, required this.repository});
  final PostsRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostsView(),
      ),
    );
  }
}
