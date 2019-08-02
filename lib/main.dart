import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/pages/post_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'blocs/favorite_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => FavoriteBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: PostPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
