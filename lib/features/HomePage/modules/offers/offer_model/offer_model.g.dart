// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
      offer: (json['offer'] as List<dynamic>?)
          ?.map((e) => OfferData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersModelToJson(OffersModel instance) =>
    <String, dynamic>{
      'offer': instance.offer,
    };

OfferData _$OfferDataFromJson(Map<String, dynamic> json) => OfferData(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$OfferDataToJson(OfferData instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'price': instance.price,
    };

BodyOfMessageModel _$BodyOfMessageModelFromJson(Map<String, dynamic> json) =>
    BodyOfMessageModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BodyOfMessageModelToJson(BodyOfMessageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'message': instance.message,
    };

ContactUsModel _$ContactUsModelFromJson(Map<String, dynamic> json) =>
    ContactUsModel(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ContactUsModelToJson(ContactUsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
