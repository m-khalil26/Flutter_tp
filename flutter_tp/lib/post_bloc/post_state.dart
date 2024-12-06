

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/post_bloc/post_bloc.dart';
import 'package:flutter_tp/post_bloc/post_event.dart';

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
        emit(PostsError("Failed to load posts"));
      }
    });

    on<AddPost>((event, emit) async {
      await _repository.createPost(event.newPost);
      add(LoadPosts());
    });

    on<EditPost>((event, emit) async {
      await _repository.updatePost(event.updatedPost);
      add(LoadPosts());
    });
  }
}
