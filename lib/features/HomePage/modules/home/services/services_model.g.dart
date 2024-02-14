// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServices _$GetServicesFromJson(Map<String, dynamic> json) => GetServices(
      service: (json['service'] as List<dynamic>?)
          ?.map((e) => ServiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetServicesToJson(GetServices instance) =>
    <String, dynamic>{
      'service': instance.service,
    };

ServiceData _$ServiceDataFromJson(Map<String, dynamic> json) => ServiceData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
    );

Map<String, dynamic> _$ServiceDataToJson(ServiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
    };
