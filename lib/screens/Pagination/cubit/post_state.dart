part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Post> post;
  PostLoaded(this.post);
}
class PostLoading extends PostState {
final List<Post> oldPost;
final bool isFirstFetch;
PostLoading(this.oldPost,{this.isFirstFetch=false});
}
