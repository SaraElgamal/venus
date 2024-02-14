


import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()

class OffersModel {
  List<OfferData>? offer;

  OffersModel({this.offer});

  factory OffersModel.fromJson(Map<String, dynamic> json) => _$OffersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OffersModelToJson(this);

}


@JsonSerializable()

class OfferData {
  int? id;
  String? imageUrl;
  String? title;
  String? subTitle;
  String? price;

  OfferData({this.id, this.imageUrl, this.title, this.subTitle, this.price});


  factory OfferData.fromJson(Map<String, dynamic> json) => _$OfferDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDataToJson(this);

}

@JsonSerializable()
class BodyOfMessageModel {

  String? name;
  String? email;
  String? phone;
  String? message;



  BodyOfMessageModel({this.name,this.email,this.phone,this.message});

  factory BodyOfMessageModel.fromJson(Map<String, dynamic> json) => _$BodyOfMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$BodyOfMessageModelToJson(this);

}

@JsonSerializable()
class ContactUsModel {

  String? message;



  ContactUsModel({this.message});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => _$ContactUsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);

}