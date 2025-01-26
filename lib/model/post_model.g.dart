// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      createdAtInMillis: (json['created_at_in_millis'] as num).toInt(),
      imageMedium: json['image_medium'] as String,
      commentsCount: (json['comments_count'] as num).toInt(),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_at_in_millis': instance.createdAtInMillis,
      'image_medium': instance.imageMedium,
      'comments_count': instance.commentsCount,
      'store': instance.store,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
    };
