import 'package:dio/dio.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';

class PostService {
  final String baseUrl = "https:/jsonplaceholder.typicode.com/posts";
  final Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    try {
      Response res = await dio.get(baseUrl);

      // Recebe uma lista de json's
      List list = res.data as List;

      // Cria uma lista de posts mapeadas para instâncias da classe post
      // Se não converter para lista (.toList()), pode dar erro por retornar um iterable
      List<PostModel> postList = list.map<PostModel>((post) => PostModel.fromJson(post)).toList();

      return postList;
    } catch (e) {
      throw Exception();
    }
  }
}