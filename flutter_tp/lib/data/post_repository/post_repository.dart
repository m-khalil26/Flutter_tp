
import '../datasource/datasource.dart';
import '../model/post.dart';

class PostsRepository {
  final FakePostsDataSource _dataSource;

  PostsRepository(this._dataSource);

  Future<List<Post>> getAllPosts() => _dataSource.getAllPosts();
  Future<void> createPost(Post post) => _dataSource.createPost(post);
  Future<void> updatePost(Post post) => _dataSource.updatePost(post);
}
