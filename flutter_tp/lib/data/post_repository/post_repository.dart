import '../datasource/IDataSource.dart';
import '../model/post.dart';

class PostsRepository {
  final IDataSource _dataSource;

  PostsRepository(this._dataSource);

  Future<List<Post>> getAllPosts() async {
    try {
      return await _dataSource.getAllPosts();
    } catch (e) {
      throw Exception("Failed to load posts: ${e.toString()}");
    }
  }

  Future<void> createPost(Post post) async {
    try {
      await _dataSource.createPost(post);
    } catch (e) {
      throw Exception("Failed to create post: ${e.toString()}");
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      await _dataSource.updatePost(post);
    } catch (e) {
      throw Exception("Failed to update post: ${e.toString()}");
    }
  }
}
