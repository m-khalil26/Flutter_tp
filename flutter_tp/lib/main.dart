import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/post_bloc/post_state.dart';
import 'package:flutter_tp/screens/post_list_screen.dart';

import 'post_bloc/post_bloc.dart';
import 'post_bloc/post_event.dart';
import 'data/datasource/datasource.dart';
import 'data/post_repository/post_repository.dart';

void main() {
  final repository = PostsRepository(FakePostsDataSource());
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final PostsRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostsBloc(repository)..add(LoadPosts()),
      child: MaterialApp(
        home: PostsListScreen(),
      ),
    );
  }
}
