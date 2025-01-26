import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final int id;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "created_at_in_millis")
  final int createdAtInMillis;
  @JsonKey(name: "image_medium")
  final String imageMedium;
  @JsonKey(name: "comments_count")
  final int commentsCount;
  @JsonKey(name: "store")
  final Store? store;

  PostModel({
    required this.id,
    required this.createdAt,
    required this.createdAtInMillis,
    required this.imageMedium,
    required this.commentsCount,
    this.store,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

@JsonSerializable()
class Store {
  final String name;

  Store({required this.name});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
