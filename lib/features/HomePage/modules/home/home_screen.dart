import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:venus/core/components/components.dart';
import 'package:venus/features/HomePage/modules/home/product_details.dart';
import 'package:venus/features/HomePage/modules/home/servicesDetails.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';

import '../../../../core/components/consts.dart';
import '../../../../core/utils/custom_dot.dart';
import 'our_works.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentImage = 0;

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentImage = _pageController.page!.round();
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animateSlider();
    super.dispose();
  }

  void _animateSlider() {
    if (currentImage < OffersCubit.get(context).sliders!.length - 1) {
      currentImage++;
    } else {
      currentImage = 0;
    }
    if (mounted) {
      _pageController.animateToPage(
        currentImage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();
    });
  }

  List<String> images = [
    'assets/images/photo1.png',
    'assets/images/photo2.png',
    'assets/images/photo3.png',
    'assets/images/camera2.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<OffersCubit, OffersStates>(
                  builder: (context, state) {
                    if (state is GetSliderLoadingsState) {
                      return Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Center(
                            child: Lottie.asset(
                                'assets/animation/Animation - 1705103164209.json')),
                      );
                    } else {
                      return OffersCubit.get(context).sliders!.isNotEmpty
                          ? SizedBox(
                              height: 200.h,
                              width: double.infinity,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount:
                                    OffersCubit.get(context).sliders!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimatedBuilder(
                                    animation: _pageController,
                                    builder:
                                        (BuildContext context, Widget? widget) {
                                      double value = 1.0;
                                      if (_pageController
                                          .position.haveDimensions) {
                                        value = _pageController.page! - index;
                                        value = (1 - (value.abs() * 0.1))
                                            .clamp(0.0, 2.0);
                                      }
                                      return Center(
                                        child: SizedBox(
                                          height:
                                              Curves.easeOut.transform(value) *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .30,
                                          width:
                                              Curves.easeIn.transform(value) *
                                                  double.infinity,
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                0), // Remove padding around the image
                                            child: widget,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.0.r),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: CachedNetworkImage(
                                          imageUrl: OffersCubit.get(context)
                                              .sliders![index]
                                              .imageUrl
                                              .toString(),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 180.h,
                                            margin:
                                                EdgeInsets.only(right: 10.0.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Container(
                                            height: 180.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Colors
                                                  .grey, // Placeholder color

                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/placeholder.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              // You can add additional widgets for loading state (e.g., a loading spinner)
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            height: 180.h,
                                            // width: 87.w,
                                            margin:
                                                EdgeInsets.only(right: 10.0.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: Colors.grey
                                                  .shade300, // Placeholder color for error state
                                            ),
                                            // You can add additional widgets for error state (e.g., an error icon)
                                            child: Center(
                                                child: Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            )),
                                          ),
                                          fit: BoxFit.cover,
                                        ),

                                        //
                                        // Image.network(
                                        //   fit: BoxFit.fill,
                                        //
                                        //   OffersCubit.get(context).sliders![index]
                                        //       .imageUrl.toString(),
                                        //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        //     if (loadingProgress == null) {
                                        //       return child; // If the image is fully loaded, display it
                                        //     } else {
                                        //       return Placeholder(
                                        //         child: Image.asset(
                                        //
                                        //           'assets/images/placeholder.png',
                                        //         fit: BoxFit.fill,
                                        //       ),); // Display a placeholder while loading
                                        //     }
                                        //   },
                                        // ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              height: 180.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(right: 10.0.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.grey
                                    .shade300, // Placeholder color for error state
                              ),
                              // You can add additional widgets for error state (e.g., an error icon)
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 20.h),
                                  const Text('لا يوجد اتصال بالانترنت'),
                                ],
                              )),
                            );
                      // return  Image.network(
                      //   OffersCubit.get(context).sliders![0]
                      //       .imageUrl.toString(),
                      //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      //     if (loadingProgress == null) {
                      //       return child; // If the image is fully loaded, display it
                      //     } else {
                      //       return Placeholder(); // Display a placeholder while loading
                      //     }
                      //   },
                      // );
                      //  SizedBox(
                      //   height: 180.h,
                      //   width: double.infinity,
                      //   child: PageView.builder(
                      //
                      //     controller: _pageController,
                      //     itemCount:
                      //     OffersCubit.get(context).sliders!.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return AnimatedBuilder(
                      //         animation: _pageController,
                      //         builder:
                      //             (BuildContext context, Widget? widget) {
                      //           double value = 1.0;
                      //           if (_pageController
                      //               .position.haveDimensions) {
                      //             value = _pageController.page! - index;
                      //             value = (1 - (value.abs() * 0.1))
                      //                 .clamp(0.0, 2.0);
                      //           }
                      //           return Center(
                      //             child: SizedBox(
                      //               height:
                      //               Curves.easeOut.transform(value) *
                      //                   MediaQuery.of(context).size.height*.30,
                      //               width:
                      //               Curves.easeOut.transform(value) *
                      //                   double.infinity,
                      //               child: Container(
                      //                 padding: const EdgeInsets.all(
                      //                     0), // Remove padding around the image
                      //                 child: widget,
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         child: Padding(
                      //           padding: EdgeInsets.symmetric(
                      //               horizontal: 3.0.r),
                      //           child: ClipRRect(
                      //             borderRadius:
                      //             BorderRadius.circular(16.r),
                      //             child: Image.network(
                      //               OffersCubit.get(context).sliders![index]
                      //                   .imageUrl.toString(),
                      //               fit: BoxFit.fill,
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // );
                    }
                    return const Text('null');
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    OffersCubit.get(context).sliders!.length,
                    (index) => CustomDot(
                      currentIndex: currentImage,
                      index: index,
                      color: currentImage == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'الخدمات',
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: secondColorLines,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocConsumer<OffersCubit, OffersStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is GetServicesLoadingsState) {
                        return Center(
                            child: Lottie.asset(
                                'assets/animation/Animation - 1705103164209.json'));
                      } else if (OffersCubit.get(context)
                          .services!
                          .isNotEmpty) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          //childAspectRatio: 1/ 1.90,

                          crossAxisCount: 2,
                          //number of them
                          children: List.generate(
                            OffersCubit.get(context).services!.length,
                            (index) => InkWell(
                                onTap: ()
                                {
navigateTo(context, ServicesDetails(index: index,));
                                },
                                child: buildGridView(index)),
                          ),
                        );
                      } else {
                        return Container(
                          height: 300.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 10.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.grey
                                .shade300, // Placeholder color for error state
                          ),
                          // You can add additional widgets for error state (e.g., an error icon)
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                              SizedBox(height: 20.h),
                              const Text('لا يوجد اتصال بالانترنت'),
                            ],
                          )),
                        );
                      }
                    }),

              SizedBox(height: 15.h,),
                Row(
                  children: [
                    Text(
                      'اعمالنا',
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        color: secondColorLines,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        navigateTo(context, const OurWorks());
                      },
                      child: Text(
                        'اعرف المزيد',
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: secondColorLines,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 110.h,
                  child: BlocConsumer<OffersCubit, OffersStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetCategoryLoadingsState) {
                          return Center(
                              child: Lottie.asset(
                                  'assets/animation/Animation - 1705103164209.json'));
                        } else {
                          return OffersCubit.get(context).category!.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      OffersCubit.get(context).category!.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      navigateTo(context,
                                          ProductsDetails(index: index));
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: OffersCubit.get(context)
                                          .category![index]
                                          .imageUrl
                                          .toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 110.h,
                                        width: 87.w,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        height: 110.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color:
                                              Colors.grey, // Placeholder color

                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/placeholder.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          // You can add additional widgets for loading state (e.g., a loading spinner)
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 110.h,
                                        width: 87.w,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: Colors
                                              .red, // Placeholder color for error state
                                        ),
                                        // You can add additional widgets for error state (e.g., an error icon)
                                        child: Center(child: Icon(Icons.error)),
                                      ),
                                      fit: BoxFit.cover,
                                    ),

                                    // Container(
                                    //   height: 110.h,
                                    //   width: 87.w,
                                    //   margin: EdgeInsets.only(right: 10.0.w),
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(8),
                                    //     image: DecorationImage(
                                    //
                                    //         fit: BoxFit.cover,
                                    //         image: NetworkImage(
                                    //             OffersCubit
                                    //                 .get(context)
                                    //                 .category![index].imageUrl
                                    //                 .toString())),
                                    //   ),
                                    // ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      //   navigateTo(context, ProductsDetails(index: index));
                                    },
                                    child: Container(
                                      height: 120.h,
                                      width: 87.w,
                                      margin: EdgeInsets.only(right: 10.0.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: Colors.grey
                                            .shade300, // Placeholder color for error state
                                      ),
                                      // You can add additional widgets for error state (e.g., an error icon)
                                      child: Center(
                                          child: Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      )),
                                    ),
                                  ),

                                  // Container(
                                  //   height: 110.h,
                                  //   width: 87.w,
                                  //   margin: EdgeInsets.only(right: 10.0.w),
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(8),
                                  //     image: DecorationImage(
                                  //
                                  //         fit: BoxFit.cover,
                                  //         image: NetworkImage(
                                  //             OffersCubit
                                  //                 .get(context)
                                  //                 .category![index].imageUrl
                                  //                 .toString())),
                                  //   ),
                                  // ),
                                );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridView(int i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
            height: 160.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(images[i].toString()),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              OffersCubit.get(context).services![i].title.toString(),
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //sub
          // SizedBox(
          //   height: 45.h,
          //   child: Text(
          //     OffersCubit.get(context).services![i].subTitle.toString(),
          //     style: GoogleFonts.tajawal(fontSize: 12.sp),
          //
          //    maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),

        ],
      );
}
