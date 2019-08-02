import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_favorite_posts/models/post_model.dart';
import 'package:flutter_favorite_posts/services/post_service.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends BlocBase{

  final _postService = PostService();

  final _postListController = BehaviorSubject<List<PostModel>>();
  Observable<List<PostModel>> get postListStream => _postListController.stream;
  Sink<List<PostModel>> get postListSink => _postListController.sink;

  PostBloc(){
    _postService.getPosts().then(postListSink.add);
  }

  @override
  void dispose() {
    _postListController.close();
    super.dispose();
  }
}