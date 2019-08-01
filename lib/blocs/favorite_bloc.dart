import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_favorite_posts/models/favorites_model.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc extends BlocBase {

  final _favoritesModel = FavoritesModel();

  final _favoritesListController = BehaviorSubject<List<PostModel>>();
  Observable<List<PostModel>> get favoritesListStream => _favoritesListController.stream;
  Sink<List<PostModel>> get favoritesListSink => _favoritesListController.sink;

  final _favoritesListAddController = BehaviorSubject<PostModel>();
  Observable<PostModel> get favoritesAddStream => _favoritesListAddController.stream;
  Sink<PostModel> get favoritesAddSink => _favoritesListAddController.sink;

  final _favoritesListDeleteController = BehaviorSubject<PostModel>();
  Observable<PostModel> get favoritesDeleteStream => _favoritesListDeleteController.stream;
  Sink<PostModel> get favoritesDeleteSink => _favoritesListDeleteController.sink;

  FavoriteBloc(){
    favoritesAddStream.listen(_handleAdd);
    favoritesDeleteStream.listen(_handleDelete);
  }

  //método para tratar quando usuário quiser adicionar post na lista de favoritos
  void _handleAdd(PostModel postModel){
    _favoritesModel.posts.add(postModel);
  }

  //método para atualizar a lista de favoritos com a lista mais atual de favoritos
  void updateList(){
    favoritesListSink.add(_favoritesModel.posts.toList());
  }

  void _handleDelete(PostModel postModel){
    _favoritesModel.posts.remove(postModel);
  }

  @override
  void dispose() {
    _favoritesListController.close();
    _favoritesListAddController.close();
    _favoritesListDeleteController.close();
    super.dispose();
  }
}