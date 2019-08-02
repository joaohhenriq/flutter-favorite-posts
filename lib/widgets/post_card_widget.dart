import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favorite_posts/blocs/favorite_bloc.dart';
import 'package:flutter_favorite_posts/blocs/favorite_card_bloc.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';

class PostCardWidget extends StatefulWidget {
  final PostModel postModel;
  final int index;

  const PostCardWidget({Key key, this.postModel, this.index}) : super(key: key);

  @override
  _PostCardWidgetState createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  FavoriteCardBloc _favoriteCardBloc;
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteCardBloc = FavoriteCardBloc(widget.postModel);

    // poderia colocar isto no build do widget também
    WidgetsBinding.instance.addPostFrameCallback((_){
      _favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();

      // sempre que o bloc pai (o bloc que contém a lista dos favoritos) emitir um
      // dado (Lista de posts - favorito excluido, ou adicionado, ou qlq outra coisa), vai
      // passar essa mudança para o filho (FavoriteCardBloc), que também possui uma lista de favoritos

      // Então eu fico escutando as alterações no favoriteBloc global. Quando emitir um evento,
      // vai atualizar a lista de posts do FavoriteCardBloc. Consequentemente, no bloc do card,
      // vai ficar escutando as atualizações nessa lista, e quando tiver, adiciona o evento no isFavorite
      _favoriteBloc.favoritesListStream.listen(_favoriteCardBloc.favoritesListSink.add);
    });
    super.initState();
  }

  @override
  void dispose() {
    _favoriteCardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(8),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${widget.index}.jpg"))),
        width: 200,
        height: 250,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: StreamBuilder<bool>(
                  stream: _favoriteCardBloc.isFavoriteStream,
                  initialData: false,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: snapshot.data ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        print("alguma coisa");
                      },
                    );
                  },
                ),
              ),
              Text(
                "${widget.postModel.title}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${widget.postModel.body}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
