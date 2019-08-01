import 'package:flutter_favorite_posts/models/post_model.dart';

class FavoritesModel {
  // Usa Set e não List pq no set não é permitido inserir dois registros
  // iguais, enquanto no List é permitido. E no nosso caso não queremos
  // favoritar o mesmo post duas vezes (Set funciona como uma lista, mas
  // que não permite itens duplicados)
  final Set<PostModel> _postList = <PostModel>{};

  Set<PostModel> get posts => _postList;

  void addPost(PostModel postModel) => _postList.add(postModel);

  void deletePost(PostModel postModel) => _postList.remove(postModel);
}