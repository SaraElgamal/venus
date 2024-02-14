
import 'package:json_annotation/json_annotation.dart';

part 'services_model.g.dart';

@JsonSerializable()

class GetServices {
  List<ServiceData>? service;

  GetServices({this.service});


  factory GetServices.fromJson(Map<String, dynamic> json) => _$GetServicesFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesToJson(this);


}

@JsonSerializable()
class ServiceData {
  int? id;
  String? title;
  String? subTitle;

  ServiceData({this.id, this.title, this.subTitle});


  factory ServiceData.fromJson(Map<String, dynamic> json) => _$ServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDataToJson(this);



}