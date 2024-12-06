
import '../data/model/post.dart';

abstract class PostsEvent {}

class LoadPosts extends PostsEvent {}

class AddPost extends PostsEvent {
  final Post newPost;
  AddPost(this.newPost);
}

class EditPost extends PostsEvent {
  final Post updatedPost;
  EditPost(this.updatedPost);
}
