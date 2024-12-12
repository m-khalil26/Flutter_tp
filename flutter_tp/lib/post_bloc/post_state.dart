
import '../data/model/post.dart';

abstract class PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}

class PostsEmpty extends PostsState {}

class PostsError extends PostsState {
  final String message;
  PostsError(this.message);
}
