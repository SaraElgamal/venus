// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategory _$GetCategoryFromJson(Map<String, dynamic> json) => GetCategory(
      state: json['state'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryToJson(GetCategory instance) =>
    <String, dynamic>{
      'state': instance.state,
      'data': instance.data,
    };

DataCategory _$DataCategoryFromJson(Map<String, dynamic> json) => DataCategory(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$DataCategoryToJson(DataCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
    };

GetProducts _$GetProductsFromJson(Map<String, dynamic> json) => GetProducts(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProductsToJson(GetProducts instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'title': instance.title,
    };
