import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus/core/components/consts.dart';
import 'package:venus/features/HomePage/modules/contact_us.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';
import 'package:venus/features/HomePage/modules/offers/offers.dart';

import '../../../../core/components/components.dart';

class DetailsOffers extends StatelessWidget {

 int index ;
  DetailsOffers({required this.index});
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
backgroundColor: primaryColor,
      body: detailsBuild(context,index),
    ));
  }
  Widget detailsBuild( context , index) => BlocConsumer<OffersCubit,OffersStates>(
    listener: (context, state) {

    },
    builder: (context, state) {
      var cubit = OffersCubit.get(context);
      return ListView(
        physics: const BouncingScrollPhysics(),

          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [

                CachedNetworkImage(
                  imageUrl: cubit.offers![index].imageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 470.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 470.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey, // Placeholder color

                      image: DecorationImage(
                        image: AssetImage('assets/images/placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                      // You can add additional widgets for loading state (e.g., a loading spinner)

                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 470.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.red, // Placeholder color for error state
                    ),
                    // You can add additional widgets for error state (e.g., an error icon)
                    child: Center(child: Icon(Icons.error)),
                  ),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 20.h,
                  right: 20.w,
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),

                    child: Center(
                      child: IconButton(
                        icon:
                        const Icon(Icons.arrow_back_ios,color: Colors.black,),
                        onPressed: (){
                          Navigator.pop(context);
                          // ClinicCubit.get(context).clearData();
                        },
                      ),
                    ),
                  ),
                ),
                // Image.network(
                //   cubit.offers![index].imageUrl.toString(),
                //   width: double.infinity,
                //   height: 470.h,
                //   fit: BoxFit.cover,
                // ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 300.h, bottom: 0.h,),
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 16.h, right: 16.w),
                        child: Text(cubit.offers![index].title.toString(),
                          // cli.serviceProvider.toString().length > 31
                          //     ? cli.serviceProvider.toString().substring(0 , 30)
                          //     :
                          // cli.serviceProvider.toString(),
                          style: GoogleFonts.tajawal(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 10.h,),
                  // Row(
                  //   children: [
                  //
                  //     SizedBox(width: 5.w,),
                  //     // Flexible(
                  //     //   child: Text(
                  //     //     'مرحبًا بكم في موقعنا المتخصص في تصوير الحفلات وتصميم ومونتاج و الأفلام الوثائقية وتصوير المطاعم والمناسبات.',
                  //     //     style: GoogleFonts.tajawal(
                  //     //       fontSize: 16.sp,
                  //     //       color: textColorLines,
                  //     //       height: 1.5,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  SizedBox(height: 10.h,),
                  Container(
                    height: 150.h,
                    child: Row(
                      children: [
                        SizedBox(width: 5.w,),
                        Flexible(
                          child: Text(
                            cubit.offers![index].subTitle.toString(),
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: textColorLines,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),

                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text('السعر : ', style: GoogleFonts.tajawal(
                        fontSize: 20.sp,
                        color: secondColorLines,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Flexible(
                        child: Text('\$ ${cubit.offers![index].price}', style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color: secondColorLines,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h,),
                  defaultButtonBlack(

                      context: context,
                      text: 'تواصل معنا',
                      toPage: () {
                        navigateTo(context, ContactUs());
                      }

                  ),


                ],
              ),
            ),
          ],

      );
    }
  );


}
