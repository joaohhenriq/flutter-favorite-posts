import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/blocs/favorite_bloc.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:flutter_favorite_posts/widgets/post_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    FavoriteBloc _favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();
    int image = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(FontAwesomeIcons.code),
            SizedBox(width: 15,),
            Text("Favorites Page"),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: StreamBuilder<List<PostModel>>(
            stream: _favoriteBloc.favoritesListStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<PostModel>> snapshot) {
              if (snapshot.hasData && snapshot.data.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel postModel = snapshot.data[index];
                      image++;
                      if (image == 6) image = 1;
                      return Dismissible(
                        onDismissed: (direction){
                          _favoriteBloc.favoritesDeleteSink.add(postModel);
                        },
                        key: Key("${postModel.id}"),
                        child: PostCardWidget(
                          isInFavoriteList: true,
                          postModel: postModel,
                          index: image,
                        )
                      );
                    });
              } else
                return Center(
                  child: Text("You didn't favorited any post yet!", style: TextStyle(color: Colors.white),),
                );
            }),
      ),
    );
  }
}
