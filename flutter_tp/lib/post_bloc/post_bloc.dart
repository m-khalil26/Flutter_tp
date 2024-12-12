import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/post_bloc/post_event.dart';
import 'package:flutter_tp/post_bloc/post_state.dart';

import '../data/post_repository/post_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _repository;

  PostsBloc(this._repository) : super(PostsLoading()) {
    on<LoadPosts>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await _repository.getAllPosts();
        if (posts.isEmpty) {
          emit(PostsEmpty());
        } else {
          emit(PostsLoaded(posts));
        }
      } catch (e) {
        emit(PostsError("Failed to load posts: ${e.toString()}"));
      }
    });

    on<AddPost>((event, emit) async {
      try {
        await _repository.createPost(event.newPost);
        add(LoadPosts());
      } catch (e) {
        emit(PostsError("Failed to add post: ${e.toString()}"));
      }
    });

    on<EditPost>((event, emit) async {
      try {
        await _repository.updatePost(event.updatedPost);
        add(LoadPosts());
      } catch (e) {
        emit(PostsError("Failed to edit post: ${e.toString()}"));
      }
    });
  }
}