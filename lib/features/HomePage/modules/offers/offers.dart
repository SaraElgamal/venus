import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:venus/core/components/components.dart';
import 'package:venus/core/components/consts.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';
import 'package:venus/features/HomePage/modules/offers/offer_model/offer_model.dart';

import 'offers_details.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<OffersCubit,OffersStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                if(state is GetOffersLoadingState) {
                  return Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Lottie.asset('assets/animation/Animation - 1705103164209.json')),
                    ],
                  );

                }
                else {
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OffersCubit.get(context).offers!.isNotEmpty
                ?  ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            itemOffersBuilder(context,OffersCubit.get(context).offers![index],index),
                        itemCount: OffersCubit.get(context).offers!.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h,),
                      ) : Container(
                height: 180.h,
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
                    ],
                  );
                }
              }
            ),
          ),
        ),
      ),
    );
  }
  Widget itemOffersBuilder (context,OfferData offer,index) =>
      BlocConsumer<OffersCubit,OffersStates>(
    listener: (context, state) {

    },
    builder: (context, state) =>  InkWell(
      onTap: ()
      {
        navigateTo(context,  DetailsOffers(index: index,) );
      },
      child: Stack(
        children: [
          Container(
            height: 117.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: primaryColor,
            ),
          ),
          Positioned(
              right: 8.w,
              left: 240.w,
              top: 2.h,

              child:
// Image.network(
//
//
//   offer.imageUrl.toString()
//   ,fit: BoxFit.cover,
//   loadingBuilder:
//       (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//     if (loadingProgress == null) {
//       return child; // If the image is fully loaded, display it
//     } else {
//       return Placeholder(
//         child: Image.asset(
//
//           'assets/images/placeholder.png',
//           fit: BoxFit.fill,
//         ),); // Display a placeholder while loading
//     }
//   },
// ),
// Container(
//   height: 112.h,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(14),
//     image: DecorationImage(
//
//         image:
//
//         NetworkImage(
//
//             offer.imageUrl.toString(),),fit: BoxFit.cover,)
//   ),
//
// ),
              CachedNetworkImage(
                imageUrl: offer.imageUrl.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  height: 112.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  height: 112.h,
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
                  height: 112.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.red, // Placeholder color for error state
                  ),
                  // You can add additional widgets for error state (e.g., an error icon)
                  child: Center(child: Icon(Icons.error)),
                ),
                fit: BoxFit.cover,
              )
          ),
          Positioned(
            top: 16.h,
            left: 10.w,
            right: 131.w,
            child: Text(offer.title.toString(),
              style: GoogleFonts.cairo(
color: secondColorLines,
              fontWeight: FontWeight.bold,
                fontSize: 14.sp,
            ),
            maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: 45.h,
            left: 10.w,
            right: 131.w,
            child: Text(offer.subTitle.toString(),style: GoogleFonts.tajawal(
fontSize: 12.sp,
height: 1.4,
color: textColorLines,
            ),

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Positioned(
            left: 8.w,
            right: 320.w,
            top: 80.h,
            child: Icon(Icons.arrow_forward),
          ),


        ],
      ),
    ),
  );
}
