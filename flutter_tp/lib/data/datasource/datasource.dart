import '../model/post.dart';
import 'IDataSource.dart';


class FakePostsDataSource implements IDataSource {
  final List<Post> _fakePosts = [
    Post(id: '1', title: 'Post 1', description: 'Description Post 1'),
    Post(id: '2', title: 'Post 2', description: 'Description Post 2'),
    Post(id: '3', title: 'Post 3', description: 'Description Post 3'),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return _fakePosts;
    } catch (e) {
      throw Exception("Failed to fetch posts");
    }
  }

  @override
  Future<void> createPost(Post postToAdd) async {
    if (postToAdd.title.isEmpty || postToAdd.description.isEmpty) {
      throw Exception("Post title or description cannot be empty");
    }
    try {
      await Future.delayed(const Duration(seconds: 1));
      _fakePosts.add(postToAdd);
    } catch (e) {
      throw Exception("Failed to create post");
    }
  }

  @override
  Future<void> updatePost(Post updatedPost) async {
    if (updatedPost.title.isEmpty || updatedPost.description.isEmpty) {
      throw Exception("Post title or description cannot be empty");
    }
    try {
      await Future.delayed(const Duration(seconds: 1));
      final index = _fakePosts.indexWhere((post) => post.id == updatedPost.id);
      if (index != -1) {
        _fakePosts[index] = updatedPost;
      } else {
        throw Exception("Post not found");
      }
    } catch (e) {
      throw Exception("Failed to update post");
    }
  }
}
