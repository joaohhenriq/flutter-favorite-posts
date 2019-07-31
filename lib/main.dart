import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/pages/post_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PostPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
