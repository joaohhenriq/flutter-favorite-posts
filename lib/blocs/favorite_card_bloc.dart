import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteCardBloc extends BlocBase {

  final _favoritesListController = BehaviorSubject<List<PostModel>>();
  Observable<List<PostModel>> get favoritesListStream => _favoritesListController.stream;
  Sink<List<PostModel>> get favoritesListSink => _favoritesListController.sink;

  final _isFavoriteController = BehaviorSubject<bool>();
  Observable<bool> get isFavoriteStream => _isFavoriteController.stream;
  Sink<bool> get isFavoriteSink => _isFavoriteController.sink;

  FavoriteCardBloc(PostModel postModel){

    // compartilhamento de informações entre dois blocs, da lista de favoritos e do card
    // recebemos no construtor um post, verificamos se o post está na lista de favoritos
    // mapeando para um bool, e adicionamos ao bloc isFavorite o valor retornado
    favoritesListStream
        .map((values) => values.contains(postModel))
        .listen(isFavoriteSink.add);
  }

  @override
  void dispose() {
    _isFavoriteController.close();
    _favoritesListController.close();
    super.dispose();
  }
}