import 'package:flutter/material.dart';

class PostCardWidget extends StatefulWidget {
  @override
  _PostCardWidgetState createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("post widget"),
      ),
    );
  }
}
