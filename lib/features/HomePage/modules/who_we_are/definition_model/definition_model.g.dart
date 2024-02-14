// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDefinitions _$GetAllDefinitionsFromJson(Map<String, dynamic> json) =>
    GetAllDefinitions(
      header: json['header'] == null
          ? null
          : HeaderData.fromJson(json['header'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
      cards: json['cards'] == null
          ? null
          : Cards.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllDefinitionsToJson(GetAllDefinitions instance) =>
    <String, dynamic>{
      'header': instance.header,
      'statistics': instance.statistics,
      'cards': instance.cards,
    };

HeaderData _$HeaderDataFromJson(Map<String, dynamic> json) => HeaderData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$HeaderDataToJson(HeaderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      photoSessions: json['photoSessions'] as String?,
      worksShops: json['worksShops'] as String?,
      customersReviews: json['customersReviews'] as String?,
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'photoSessions': instance.photoSessions,
      'worksShops': instance.worksShops,
      'customersReviews': instance.customersReviews,
    };

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      card1: json['card1'] == null
          ? null
          : Card1.fromJson(json['card1'] as Map<String, dynamic>),
      card2: json['card2'] == null
          ? null
          : Card1.fromJson(json['card2'] as Map<String, dynamic>),
      card3: json['card3'] == null
          ? null
          : Card1.fromJson(json['card3'] as Map<String, dynamic>),
      card4: json['card4'] == null
          ? null
          : Card1.fromJson(json['card4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'card1': instance.card1,
      'card2': instance.card2,
      'card3': instance.card3,
      'card4': instance.card4,
    };

Card1 _$Card1FromJson(Map<String, dynamic> json) => Card1(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$Card1ToJson(Card1 instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
