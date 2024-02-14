// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => SlidersData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'sliders': instance.sliders,
    };

SlidersData _$SlidersDataFromJson(Map<String, dynamic> json) => SlidersData(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$SlidersDataToJson(SlidersData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
    };

FooterGet _$FooterGetFromJson(Map<String, dynamic> json) => FooterGet(
      footer: (json['footer'] as List<dynamic>?)
          ?.map((e) => FooterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FooterGetToJson(FooterGet instance) => <String, dynamic>{
      'footer': instance.footer,
    };

FooterData _$FooterDataFromJson(Map<String, dynamic> json) => FooterData(
      id: json['id'] as int?,
      address: json['address'] as String?,
      timing: json['timing'] as String?,
      phone1: json['phone1'] as String?,
      phone2: json['phone2'] as String?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      youtube: json['youtube'] as String?,
    );

Map<String, dynamic> _$FooterDataToJson(FooterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'timing': instance.timing,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'youtube': instance.youtube,
    };
