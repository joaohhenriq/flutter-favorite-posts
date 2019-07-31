import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc extends BlocBase {

  final _favoritesListController = BehaviorSubject<List<PostModel>>();
  Observable<List<PostModel>> get favoritesListStream => _favoritesListController.stream;
  Sink<List<PostModel>> get favoritesListSink => _favoritesListController.sink;



  @override
  void dispose() {
    _favoritesListController.close();
    super.dispose();
  }
}