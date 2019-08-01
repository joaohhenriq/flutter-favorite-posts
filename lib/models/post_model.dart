import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel();

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  // criterio para comparar quando uma instância de classe será igual a outra
  // - se a instância é da classe PostModel
  // - se o id da outra classe é igual à da classe atual
  bool operator == (other) => other is PostModel && other.id == id;

  // número grande que serve como identificador da instância dentro da lista
  // otimiza essa pesquisa por igualidade dentro da lista (Set)
  @override
  int get hashCode => super.hashCode ^ userId.hashCode * title.hashCode ^ body.hashCode;
}
