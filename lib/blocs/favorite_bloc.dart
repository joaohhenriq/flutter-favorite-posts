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

  @override
  void dispose() {
    _favoritesListController.close();
    _favoritesListAddController.close();
    _favoritesListDeleteController.close();
    super.dispose();
  }
}