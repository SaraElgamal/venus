




import 'package:venus/features/HomePage/modules/home/Slider/Slider_model/slider_model.dart';
import 'package:venus/features/HomePage/modules/home/services/services_model.dart';
import 'package:venus/features/HomePage/modules/who_we_are/definition_model/definition_model.dart';

import '../../core/web_services/web_services.dart';
import '../HomePage/modules/home/category/category_model.dart';
import '../HomePage/modules/offers/offer_model/offer_model.dart';

class Repository
{
  final WebServices webServices ;

  Repository(this.webServices);

  Future<OffersModel> getOffers () async
  {
    return  await webServices.getOffers();
  }

  Future<SliderModel> getSlider () async
  {
    return  await webServices.getSlider();
  }

  Future<ContactUsModel> postContactUs (BodyOfMessageModel body) async
  {
    return  await webServices.postContactUs(body);
  }


  Future<GetCategory> getCategory() async {
    return  await webServices.getCategory();
  }



  Future<GetServices> getServices() async {
    return  await webServices.getServices();
  }

  Future<GetAllDefinitions> getDefinition() async {
    return  await webServices.getDefinition();
  }

  Future<GetProducts> getProducts() async {
    return  await webServices.getProducts();
  }

  Future<FooterGet> getFooter() async {
    return  await webServices.getFooter();
  }
}
