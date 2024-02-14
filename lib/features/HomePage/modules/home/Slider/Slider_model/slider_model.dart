import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()


class SliderModel {
  List<SlidersData>? sliders;

  SliderModel({this.sliders});


  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);

}


@JsonSerializable()

class SlidersData {
  int? id;
  String? imageUrl;

  SlidersData({this.id, this.imageUrl});

  factory SlidersData.fromJson(Map<String, dynamic> json) => _$SlidersDataFromJson(json);

  Map<String, dynamic> toJson() => _$SlidersDataToJson(this);


}
@JsonSerializable()
class FooterGet {
  List<FooterData>? footer;

  FooterGet({this.footer});

  factory FooterGet.fromJson(Map<String, dynamic> json) => _$FooterGetFromJson(json);

  Map<String, dynamic> toJson() => _$FooterGetToJson(this);


}
@JsonSerializable()
class FooterData {
  int? id;
  String? address;
  String? timing;
  String? phone1;
  String? phone2;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;

  FooterData({this.id,
    this.address,
    this.timing,
    this.phone1,
    this.phone2,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube});

  factory FooterData.fromJson(Map<String, dynamic> json) => _$FooterDataFromJson(json);

  Map<String, dynamic> toJson() => _$FooterDataToJson(this);


}