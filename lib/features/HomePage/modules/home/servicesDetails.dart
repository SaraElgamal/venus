import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:venus/core/components/components.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/components/consts.dart';

class ServicesDetails extends StatefulWidget {
  int index ;

  ServicesDetails({required this.index});
  @override
  State<ServicesDetails> createState() => _ServicesDetailsState(index: index);

}

class _ServicesDetailsState extends State<ServicesDetails> {
  int index ;
  _ServicesDetailsState({required this.index});
 // late VideoPlayerController _controller;
 // late Future<void> _initializeVideoPlayerFuture;
  List<String> images = [
    'assets/images/photo1.png',
    'assets/images/photo2.png',
    'assets/images/photo3.png',
    'assets/images/camera2.png',
  ];

  @override
  void initState() {
    super.initState();
  //  String videoUrl = OffersCubit.get(context).productsCat![index].videoUrl.toString();

    // _controller = VideoPlayerController.network(videoUrl);
    // _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
   // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarDefaultTheme(
            context: context, isReverse: true, title: 'الخدمات'),
        //backgroundColor: primaryColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: BlocConsumer<OffersCubit,OffersStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                if(OffersCubit.get(context).services!.isNotEmpty) {
                  return ListView(
                    //
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //
                    children: [
                      SizedBox(height : 20.h),

                      InkWell(
                        onTap: ()
                        {
                          navigateTo(context, ZoomableImage(

                            imageUrls:
                          images[widget.index].toString(),


                          ));
                        },
                        child:
                        Container(
                          height: 230.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey.shade100, // Placeholder color

                            image: DecorationImage(
                              image: AssetImage(images[widget.index].toString()),
                              fit: BoxFit.cover,
                            ),
                            // You can add additional widgets for loading state (e.g., a loading spinner)

                          ),
                        ),

                      ),



                      SizedBox(height : 30.h),
                      Center(
                        child: Text(
                          OffersCubit
                              .get(context)
                              .services![widget.index].title.toString(),
                          style: GoogleFonts.cairo(
                            fontSize: 20.sp,
                            color: secondColorLines,
                            fontWeight: FontWeight.w700,
                          ),


                        textAlign: TextAlign.center,),
                      ),
                      SizedBox(height : 10.h),
                      Divider(),
                      SizedBox(height : 10.h),
                      Text(
                        OffersCubit
                            .get(context)
                            .services![widget.index].subTitle.toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          color: secondColorLines,
                          fontWeight: FontWeight.normal,
                        ),),
                      SizedBox(height : 20.h),




                    ],
                  );
                }else {return  Center(
                  child:  Lottie.asset(
                      'assets/animation/Animation - 1705103164209.json'),
                );}
              }
          ),
        ),
      ),



    );
  }


}



class ZoomableImage extends StatelessWidget {
  final String imageUrls;


  ZoomableImage({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(context: context, isReverse:
      true, title: ''),
      body: PhotoViewGallery.builder(
        scrollPhysics: BouncingScrollPhysics(),
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(imageUrls),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController
          (initialPage: 0),
      ),
    );
  }
}
