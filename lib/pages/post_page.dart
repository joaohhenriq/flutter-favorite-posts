import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/blocs/post_bloc.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';

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
        title: Text("Posts Page"),
        centerTitle: true,
      ),
      body: Container(
          child: StreamBuilder<List<PostModel>>(
              stream: _postBloc.postListStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PostModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      PostModel postModel = snapshot.data[index];
                      image++;
                      if (image == 6) image = 1;
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        margin: EdgeInsets.all(8),
                        elevation: 5.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/$image.jpg"))),
                          width: 200,
                          height: 250,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(colors: [
                                Colors.black12,
                                Colors.black
                              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: (){print("alguma coisa");}),
                                ),
//                                Text("Id: ${postModel.id}", style: TextStyle(color: Colors.white),),
//                                SizedBox(height: 10.0,),
                                Text("${postModel.title}", style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),),
                                SizedBox(height: 10.0,),
                                Text("${postModel.body}", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
