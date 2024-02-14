import 'package:json_annotation/json_annotation.dart';

part 'definition_model.g.dart';

@JsonSerializable()


class GetAllDefinitions {
  HeaderData? header;
  Statistics? statistics;
  Cards? cards;

  GetAllDefinitions({this.header, this.statistics, this.cards});


  factory GetAllDefinitions.fromJson(Map<String, dynamic> json) => _$GetAllDefinitionsFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllDefinitionsToJson(this);

}


@JsonSerializable()
class HeaderData {
  int? id;
  String? title;
  String? description;
  String? image;

  HeaderData({this.id, this.title, this.description, this.image});


  factory HeaderData.fromJson(Map<String, dynamic> json) => _$HeaderDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderDataToJson(this);

}


@JsonSerializable()
class Statistics {
  String? photoSessions;
  String? worksShops;
  String? customersReviews;

  Statistics({this.photoSessions, this.worksShops, this.customersReviews});

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);

}

@JsonSerializable()
class Cards {
  Card1? card1;
  Card1? card2;
  Card1? card3;
  Card1? card4;

  Cards({this.card1, this.card2, this.card3, this.card4});
  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);

  Map<String, dynamic> toJson() => _$CardsToJson(this);

}


@JsonSerializable()
class Card1 {
  String? title;
  String? description;

  Card1({this.title, this.description});

  factory Card1.fromJson(Map<String, dynamic> json) => _$Card1FromJson(json);

  Map<String, dynamic> toJson() => _$Card1ToJson(this);

}