

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()

class GetCategory {
  bool? state;
  List<DataCategory>? data;

  GetCategory({this.state, this.data});


  factory GetCategory.fromJson(Map<String, dynamic> json) => _$GetCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryToJson(this);

}



@JsonSerializable()
class DataCategory {
  int? id;
  String? title;
  String? imageUrl;

  DataCategory({this.id, this.title, this.imageUrl});

  factory DataCategory.fromJson(Map<String, dynamic> json) => _$DataCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryToJson(this);

}

@JsonSerializable()
class GetProducts {
  List<Products>? products;

  GetProducts({this.products});

  factory GetProducts.fromJson(Map<String, dynamic> json) => _$GetProductsFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsToJson(this);

}


@JsonSerializable()
class Products {
  int? id;
  String? imageUrl;
  String? videoUrl;
  String? title;

  Products({this.id, this.imageUrl, this.videoUrl, this.title});

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);


}