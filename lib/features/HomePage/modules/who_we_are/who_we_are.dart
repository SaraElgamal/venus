import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venus/core/components/consts.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://venuzapp.github.io/');
    var cubit = OffersCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: OffersCubit.get(context).offers!.isNotEmpty ?
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<OffersCubit,OffersStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 24.h,),
                  Stack(

                    children: [
                      Container(
                        height: 250.h,
                        width: double.infinity,
                      ),
                      Positioned(

                        child: Container(
                          height: 203.h,
                          width: 163.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/who.png'),

                            ),
                            color: primaryColor,
                            borderRadius:  BorderRadius.only(topLeft: Radius.circular(32)),
                          ),
                        ),
                      ),

                      Positioned(

                        right: 172.w,
                        top: 10.h,
                        child: Text(cubit.defineHeader!.title.toString(),
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),),
                      ),
                      Positioned(
                        left: 6.w,
                        right: 171.w,
                        top: 38.h,
                        child: Text(cubit.defineHeader!.description.toString(),
                          style: GoogleFonts.cairo(
                            height: 1.3,
                            fontSize: 14.sp,
                          ),),
                      ),
                      Positioned(
                        left: 6.w,
                        right: 100.w,
                        top: 180.h,
                        bottom: 0.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(

                                color: Colors.grey.shade400,

                                blurRadius: 6,



                                offset: const Offset(0, 5), // Shadow position

                              ),
                            ],
                          ),
                          height: 63.h,
                          width: 300.w,

                        ),
                      ),
                      /// container white
                      Positioned(

                        right: 130.w,
                        top: 190.h,
                        bottom: 0.h,
                        child: Text('${cubit.defineStatic!.worksShops} +' ,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 16.sp,
                          ),),
                      ),
                      Positioned(

                        right: 110.w,
                        top: 210.h,
                        bottom: 0.h,
                        child: Text('حملات التصوير',
                          style: GoogleFonts.tajawal(
                            height: 1.3,
                            fontWeight: FontWeight.w900,
                            fontSize: 11.sp,
                          ),),
                      ),
                      Positioned(
                        left: 155.w,


                        top: 190.h,

                        child: Container(
                          color: secondColorLines,
                          width: 1.w,
                          height: 38.h,
                        ),
                      ),
                      /// 1
                      Positioned(
                        left: 100.w,

                        top: 190.h,
                        bottom: 0.h,
                        child: Text('0 +',   style: GoogleFonts.tajawal(
                          height: 1.3,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.sp,
                        ), ),
                      ),
                      Positioned(
                        left: 85.w,

                        top: 210.h,
                        bottom: 0.h,
                        child: Text('اراء عملائنا',   style: GoogleFonts.tajawal(
                          height: 1.3,
                          fontWeight: FontWeight.w900,
                          fontSize: 11.sp,
                        ),),
                      ),
                      Positioned(
                        left: 80.w,


                        top: 190.h,

                        child: Container(
                          color: secondColorLines,
                          width: 1.w,
                          height: 38.h,
                        ),
                      ),
                      /// 2
                      Positioned(
                        left: 23.w,

                        top: 190.h,
                        bottom: 0.h,
                        child: Text(cubit.defineStatic!.photoSessions.toString(),   style: GoogleFonts.tajawal(
                          height: 1.3,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.sp,
                        ),),
                      ),
                      Positioned(
                        left: 16.w,

                        top: 210.h,
                        bottom: 0.h,
                        child: Text('تم الافتتاح',   style: GoogleFonts.tajawal(
                          height: 1.3,
                          fontWeight: FontWeight.w900,
                          fontSize: 11.sp,
                        ),),
                      ),

                    ],
                  ),
                  SizedBox(height: 5.h,),
                  TextButton(onPressed: ()
                  {
                    launchUrl(url);
                  }, child: Text('سياسة الخصوصية',style: GoogleFonts.cairo(decoration: TextDecoration.underline),)),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 350.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),

                          ),

                          Positioned(
                              top: 20.h,
                              right: 61.w,
                              child: Text('مبادئنا',style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),)),
                          Positioned(
                              top: 59.h,
                              right: 2.w,
                              left: 2.w,
                              child: Text('${cubit.defineCards!.card1!.title.toString()} ${cubit.defineCards!.card1!.description.toString()}',style: GoogleFonts.cairo(

                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      SizedBox(width: 10.w,),
                      Stack(
                        children: [
                          Container(
                            height: 350.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),

                          ),

                          Positioned(
                              top: 20.h,
                              right: 61.w,
                              child: Text('رسالتنا',style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),)),
                          Positioned(
                              top: 59.h,
                              right: 2.w,
                              left: 2.w,
                              child: Text('${cubit.defineCards!.card2!.title.toString()} ${cubit.defineCards!.card2!.description.toString()}',style: GoogleFonts.cairo(

                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 350.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),

                          ),

                          Positioned(
                              top: 20.h,
                              right: 61.w,
                              child: Text('قيمنا',style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),)),
                          Positioned(
                              top: 59.h,
                              right: 2.w,
                              left: 2.w,
                              child: Text('${cubit.defineCards!.card3!.title.toString()} ${cubit.defineCards!.card3!.description.toString()}',style: GoogleFonts.cairo(

                                fontSize: 14.sp,
                                color:  Colors.black,
                              ),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      SizedBox(width: 10.w,),
                      Stack(
                        children: [
                          Container(
                            height: 350.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),

                          ),

                          Positioned(
                              top: 20.h,
                              right: 61.w,
                              child: Text('رؤيتنا',style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),)),
                          Positioned(
                              top: 59.h,
                              right: 2.w,
                              left: 2.w,
                              child: Text('${cubit.defineCards!.card4!.title.toString()} ${cubit.defineCards!.card4!.description.toString()}',style: GoogleFonts.cairo(

                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ],
                  ),
                ]),
              );
            },

          ),
        ) :  Container(
        height:double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(right: 10.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade300, // Placeholder color for error state
        ),
        // You can add additional widgets for error state (e.g., an error icon)
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Icon(Icons.error_outline,color: Colors.red,),
            SizedBox(height : 20.h),
            const   Text('لا يوجد اتصال بالانترنت'),
          ],
        )),
      ),
      ),
    );
  }
}
