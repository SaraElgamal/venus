

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:venus/features/HomePage/modules/home/Slider/Slider_model/slider_model.dart';
import 'package:venus/features/HomePage/modules/home/category/category_model.dart';
import 'package:venus/features/HomePage/modules/home/services/services_model.dart';
import 'package:venus/features/HomePage/modules/offers/offer_model/offer_model.dart';

import '../../features/HomePage/modules/who_we_are/definition_model/definition_model.dart';


part 'web_services.g.dart';

@RestApi(baseUrl: ('https://venusdigital.ink/api/public/'))

abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('api/offers')
  Future<OffersModel> getOffers () ;

  @GET('api/sliders')
  Future<SliderModel> getSlider() ;

  @GET('api/categories')
  Future<GetCategory> getCategory() ;

  @GET('api/services')
  Future<GetServices> getServices() ;

  @GET('api/definitions')
  Future<GetAllDefinitions> getDefinition() ;


  @GET('api/products')
  Future<GetProducts> getProducts() ;

  @GET('api/footer')
  Future<FooterGet> getFooter() ;

  @POST('api/addMessage')
  Future<ContactUsModel> postContactUs (@Body() BodyOfMessageModel contact) ;



}