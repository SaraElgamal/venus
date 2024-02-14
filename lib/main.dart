

import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:venus/core/components/consts.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/splash_screen.dart';

import 'core/injection/injection.dart';

import 'core/utils/check_internet.dart';
import 'features/appCubit/cubit.dart';
import 'features/test.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getInit();
//   if (Platform.isWindows){
//     await DesktopWindow.setMinWindowSize(Size(240.w, 320.h));
// }
  await NetworkInfoImpl().checkInternet();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize:
        const Size(
            390,
            844
        ),
        minTextAdapt: true,

        splitScreenMode: true,
        builder: (context, child) {
          print(MediaQuery.of(context).size.width);
          print(MediaQuery.of(context).size.height);
          //320x240
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<AppCubit>(),

                ),
                BlocProvider(
                  create: (context) => getIt<OffersCubit>()..getAllOffers()..getAllSlider()..getAllCat()..getAllServices()..getAllDefinition()..getProductsForCat()..getFooterData(),

                ),

              ],

            child : MaterialApp(
              theme: ThemeData(
primarySwatch: Colors.blueGrey,
                fontFamily: GoogleFonts.tajawal(fontSize: 16.sp,).fontFamily,
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.iOS:
                  PageTransition(type: PageTransitionType.leftToRight, child: this)
                      .matchingBuilder,
                }),
              ),
            locale: const Locale('ar'),
            localizationsDelegates: const [

              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home:    SplashScreen(),
          ),
          );
        }
    );
  }
}
