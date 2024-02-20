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

class ProductsDetails extends StatefulWidget {
  int index ;
  ProductsDetails({required this.index});
  @override
  State<ProductsDetails> createState() => _ProductsDetailsState(index: index);

}

class _ProductsDetailsState extends State<ProductsDetails> {
  int index ;
  _ProductsDetailsState({required this.index});
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    String videoUrl = OffersCubit.get(context).productsCat![index].videoUrl.toString();

    _controller = VideoPlayerController.network(videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarDefaultTheme(
            context: context, isReverse: true, title: 'اعمالنا'),
        //backgroundColor: primaryColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: BlocConsumer<OffersCubit,OffersStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if(OffersCubit.get(context).productsCat!.isNotEmpty) {
                return ListView(
                  //
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  //
                  children: [
                    SizedBox(height : 20.h),
                    Text(
                      OffersCubit
                        .get(context)
                        .productsCat![index].title.toString(),
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        color: secondColorLines,
                        fontWeight: FontWeight.w700,
                      ),),
                    SizedBox(height : 20.h),


                    InkWell(
                      onTap: ()
                      {
                        navigateTo(context, ZoomableImage(imageUrls: OffersCubit
                            .get(context)
                            .productsCat![index].imageUrl.toString(),));
                      },
                      child:
                      CachedNetworkImage(
                        imageUrl:

              OffersCubit.get(context).
              productsCat![index].imageUrl.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          height: 180.h,

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
                          height: 180.h,
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
                          height: 180.h,
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
           //            Container(
           //              height: 170.h,
           //
           //              width: double.infinity,
           //              decoration: BoxDecoration(
           //                borderRadius: BorderRadius.circular(16),
           //                color: primaryColor,
           //
           //              image: DecorationImage(
           //                fit: BoxFit.cover,
           // image :
           //    NetworkImage(
           //
           //    OffersCubit.get(context).
           //    productsCat![index].imageUrl.toString(),),
           //              ),
           //              ),
           // //              child:   PhotoView(
           // //                customSize: Size(double.infinity,170.h),
           // //     backgroundDecoration: BoxDecoration(
           // //   borderRadius: BorderRadius.circular(16.r),
           // //       image: DecorationImage(
           // //         fit: BoxFit.cover,
           // //         image:    NetworkImage(
           // //
           // //           OffersCubit.get(context).
           // //           productsCat![index].imageUrl.toString(),),
           // //       ),
           // //    ),
           // //    imageProvider:
           // //    NetworkImage(
           // //
           // //    OffersCubit.get(context).
           // //    productsCat![index].imageUrl.toString(),),
           // //    ),
           //    ),
                    ),

                    SizedBox(height: 20.h,),
                    OffersCubit.get(context).productsCat![index].videoUrl == null ?

                    // Container(
                    //   height: 230.h,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(16),
                    //     color: primaryColor,
                    //
                    //   ),
                    //   child: Center(
                    //     child: Text('لا يوجد فيديو', style: GoogleFonts.cairo(
                    //       fontSize: 20.sp,
                    //       color: secondColorLines,
                    //       fontWeight: FontWeight.w700,
                    //     ), ),
                    //   ),
                    // )

                    Container()
                        :
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return Center(
                            child:  Lottie.asset(
                                'assets/animation/Animation - 1705103164209.json'),
                          );
                        }
                      },
                    ),
                    OffersCubit.get(context).productsCat![index].videoUrl != null ?

                    Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons
                              .play_arrow,
                        ),
                      ),
                    ) : Container(),
                    Center(child: Lottie.asset(
                        width: double.infinity,
                        height: 250.h,

                        'assets/animation/Animation - 1705114779290.json')),


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
            imageProvider: NetworkImage(imageUrls),
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
