import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/blocs/post_bloc.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:flutter_favorite_posts/widgets/post_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'favorites_page.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    super.initState();
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int image = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(FontAwesomeIcons.code),
            SizedBox(width: 15,),
            Text("Posts Page"),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.7),
        child: Icon(Icons.favorite, color: Colors.red,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage()));
        },
      ),
      body: Container(
        color: Colors.black87,
        child: StreamBuilder<List<PostModel>>(
          stream: _postBloc.postListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  PostModel postModel = snapshot.data[index];
                  image++;
                  if (image == 6) image = 1;
                  return PostCardWidget(
                    postModel: postModel,
                    index: image,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
