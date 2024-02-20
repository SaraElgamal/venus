import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:venus/features/appCubit/state.dart';

import '../HomePage/modules/contact_us.dart';
import '../HomePage/modules/home/home_screen.dart';
import '../HomePage/modules/offers/offers.dart';
import '../HomePage/modules/who_we_are/who_we_are.dart';
import '../web_view.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(InitialState());


  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;


  List <Widget> screens =
  [
    const HomeScreen(),
    const Offers(),
    const WhoWeAre(),
    ContactUs(),
   // WebViewApp('https://venuzapp.github.io/'),



  ];


  List <String> titles =
  [
    'الرئيسية',
    'الشبكة الطبية',
    'الكارت الطبي',
    'التقديم',

  ];

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());

  }

  
}