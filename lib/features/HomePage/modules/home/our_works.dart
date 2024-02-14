import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:venus/features/HomePage/modules/home/product_details.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/consts.dart';

class OurWorks extends StatelessWidget {
  const OurWorks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: appBarDefaultTheme
          (context: context, isReverse: true, title: ''),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child:  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            Row(
              children: [

                SizedBox(width: 6.w,),
                Text('اعمالنا',   style:  GoogleFonts.cairo(
                  color: secondColorLines,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),),
              ],
            ),
            SizedBox(height: 20.h,),
            BlocConsumer<OffersCubit,OffersStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                if(state is GetCategoryLoadingsState)
                {
                  return Center(child: Lottie.asset(
                      'assets/animation/Animation - 1705103164209.json'));
                }
                else{
                  return   GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 0.0),

                  crossAxisCount: 2,
                  //number of them

                  children: List.generate(OffersCubit.get(context).category!.length, (index) =>    InkWell(
                    onTap: () {
                      navigateTo(context, ProductsDetails(index: index,));
                    },
                    child:

                    CachedNetworkImage(
                      imageUrl:
                      OffersCubit.get(context).category![index].imageUrl.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          height: 189.h,
                          width: 166.w,

                        margin: EdgeInsets.only(right: 10.0.w),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        height: 189.h,
                        width: 166.w,
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
                        height: 189.h,
                        width: 166.w,
                        // width: 87.w,
                        margin: EdgeInsets.only(right: 10.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.grey.shade300, // Placeholder color for error state
                        ),
                        // You can add additional widgets for error state (e.g., an error icon)
                        child: Center(child: Icon(Icons.error_outline,color: Colors.red,)),
                      ),
                      fit: BoxFit.cover,
                    ),
       //              Container(
       //                height: 189.h,
       //                width: 166.w,
       //                margin:  EdgeInsets.only(right: 10.0.w),
       //                decoration: BoxDecoration(
       //                  borderRadius: BorderRadius.circular(8),
       //                  image:  DecorationImage(
       //
       //                      fit: BoxFit.cover,
       //                      image:
       //
       // NetworkImage(
       //     OffersCubit.get(context).category![index].imageUrl.toString())),
       //                ),
       //              ),
                  ),),


                );}
              }
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
