

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:venus/core/web_services/web_services.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/appCubit/repo.dart';

import '../../features/appCubit/cubit.dart';

final getIt = GetIt.instance;

void getInit() {
  getIt.registerLazySingleton<WebServices> (() => WebServices(createSetupDio()));
  getIt.registerLazySingleton<AppCubit> (() => AppCubit());
  getIt.registerLazySingleton<OffersCubit> (() => OffersCubit(getIt()));
  getIt.registerLazySingleton<Repository> (() => Repository(getIt()));




}
Dio createSetupDio()
{
  Dio dio = Dio () ;

  dio.interceptors.add(LogInterceptor(
    error: true ,
    request: true,
    requestHeader: false ,
    responseBody: true,
    requestBody: true,
    responseHeader: false,


  ));
  dio.options.followRedirects = false;
  dio.options.validateStatus =
      (status) => status != null &&  status < 500;
  dio.options.maxRedirects = 0;



  return dio;
}