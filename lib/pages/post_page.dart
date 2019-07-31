import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("post page"),
        ),
      ),
    );
  }
}
