import '../model/post.dart';


abstract class IDataSource {
  Future<List<Post>> getAllPosts();
  Future<void> createPost(Post post);
  Future<void> updatePost(Post post);
}
