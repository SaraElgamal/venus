

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:venus/core/utils/toast.dart';
import 'package:venus/features/HomePage/modules/home/Slider/Slider_model/slider_model.dart';
import 'package:venus/features/HomePage/modules/home/category/category_model.dart';
import 'package:venus/features/HomePage/modules/home/services/services_model.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';
import 'package:venus/features/HomePage/modules/offers/offer_model/offer_model.dart';

import '../../../../appCubit/repo.dart';
import '../../who_we_are/definition_model/definition_model.dart';



class OffersCubit extends Cubit<OffersStates> {
  Repository repo;

  OffersCubit(this.repo) : super(InitialState());


  static OffersCubit get(context) => BlocProvider.of(context);
  Future<bool> result = InternetConnectionChecker().hasConnection;

  List<OfferData>? offers = [];
  getAllOffers() async
  {
    emit(GetOffersLoadingState());
    await repo.getOffers().then((value) => {
      offers = value.offer,
    emit(GetOffersSuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }


  List<SlidersData>? sliders = [];
  getAllSlider() async
  {
    emit(GetSliderLoadingsState());
    await repo.getSlider().then((value) => {
      sliders = value.sliders,

      emit(GetSliderSuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }

  List<DataCategory>? category = [];
  getAllCat() async
  {
    emit(GetCategoryLoadingsState());
    await repo.getCategory().then((value) => {
      category = value.data,

      emit(GetCategorySuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }


  List<ServiceData>? services = [];
  getAllServices() async
  {
    emit(GetServicesLoadingsState());
    await repo.getServices().then((value) => {
      services = value.service,

      emit(GetCategorySuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }

  HeaderData? defineHeader ;
  Statistics? defineStatic ;
  Cards? defineCards ;
  getAllDefinition() async
  {
    emit(GetDefinitionLoadingsState());
    await repo.getDefinition().then((value) => {
      defineHeader = value.header,
      defineStatic = value.statistics,
      defineCards = value.cards,


      emit(GetDefinitionSuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }

 List<Products>? productsCat ;
  getProductsForCat() async
  {
    emit(GetProductsLoadingsState());
    await repo.getProducts().then((value) => {
   productsCat  = value.products,


      emit(GetProductsSuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });
  }

  List<FooterData>? footer ;
  getFooterData() async
  {
    emit(GetFooterLoadingsState());
    await repo.getFooter().then((value) => {
      footer  = value.footer,


      emit(GetFooterSuccessState()),
    }).catchError((error) async {

      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      }
    });



  }

  postDetails({
    required String name ,
    required String email ,
    required String phone ,
    required String message ,
}) async
  {
   emit(PostMessageLoadingState());

    await repo.postContactUs(BodyOfMessageModel(
      name: name,
      email: email,
      phone: phone,
      message: message,
    )).then((value) => {
      showToast(text: 'تم الارسال بنجاح', state: ToastStates.success),
      emit(PostMessageSuccessState()),
    }).catchError((error) async {

        if ( await result == false) {
          showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

        }
      });

  }



}