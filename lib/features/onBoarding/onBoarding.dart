// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:venus/core/components/components.dart';
// import 'package:venus/core/components/consts.dart';
//
// import '../HomePage/home_page.dart';
// class OnBoardingModel {
//   final String image;
//   final String text;
//
//
//   OnBoardingModel({
//     required this.image,
//     required this.text,
//
//   });
//
// }
// class OnBoardingScreen extends StatefulWidget {
//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//
//   var PageControl = PageController();
//
//   late PageController pageController;
//   List <OnBoardingModel> onBoard = [
//     OnBoardingModel(
//       image: 'assets/images/camera1.png',
// text: 'مرحبًا بكم في موقعنا المتخصص في تصوير الحفلات وتصميم ومونتاج و الأفلام الوثائقية وتصوير المطاعم والمناسبات.',
//     ),
//     OnBoardingModel(
//       image: 'assets/images/camera2.png',
//       text: 'نحن فخورون بدعوتكم لاكتشاف خدماتنا المتميزة في عالم التصوير والإنتاج الفني. في موقعنا',
//     ),
//     OnBoardingModel(
//       image: 'assets/images/camera3.png',
//       text: 'انضموا إلينا في رحلة فريدة من نوعها حيث يلتقي الإبداع بالاحتراف، والجودة بالفن. نحن هنا لتحويل أفكاركم إلى لحظات لا تُنسى وتصوير يروي قصة فريدة لكل مناسبة.'
//
//       ,
//
//     ),
//   ];
//
//   bool isLast = false;
//
//
//   void submit(){
//     navigateToFinish(context, const HomePage());
//  }
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController();
//     isLast = false;
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               Stack(
//
//                 children: [
//                   Container(
//                     height: 809.h,
//                   ),
//                   Container(
//                     height: 530.h,
//                     child: PageView.builder(itemBuilder: (context,index) =>
//                         Image(
//
//                           fit: BoxFit.fill,
//                           image: AssetImage(onBoard[index].image),
//
//                         ),
//
//
//                       itemCount: onBoard.length,
//                       controller: PageControl,
//                       physics: const BouncingScrollPhysics(),
//                       onPageChanged: (int index){
//                         if (index == onBoard.length-1) {
//                           setState(() {
//                             isLast = true;
//                           });
//                         }else {
//                           setState(() {
//                             isLast = false;
//                           });
//                         }
//                       },
//                     ),
//                   ),
//
//                   Positioned(
//
// left: 0,
//                     right: 0,
//                     bottom: 0.h,
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: 316.h,
//                           width: double.infinity,
//                           decoration: const BoxDecoration(
//                             color: secondColorLines,
//                             borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
//                           ),
//                         ),
//
//                         Positioned(
//                           top: 32.h,
//                           left: 155.w,
//
//                           child: SmoothPageIndicator(controller: PageControl,
//                               effect: const ExpandingDotsEffect(
//                                 dotColor: Colors.grey,
//                                 activeDotColor: primaryColor ,
//                                 expansionFactor: 3,
//                                 spacing: 5.0,
//                                 dotHeight: 10.0,
//                                 dotWidth: 10.0,
//                               ),
//                               count: onBoard.length),
//                         ),
//                         Positioned(
//                           top: 68.h,
//                           right: 20.w,
//                           child: Text('فينوس',
//                             style: GoogleFonts.tajawal(
//                               fontSize: 24.sp,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         Positioned.fill(
//                           top: 112.h,
//                           right: 20.w,
//                           left: 31.w,
//                           child: Container(
//                             height: 50.h,
//                            child : PageView.builder(itemBuilder: (context,index) =>
//                                Text(onBoard[index].text,
//
//                                  style: GoogleFonts.tajawal(
//                                    fontSize: 20.sp,
//                                    height: 1.3,
//                                    color: const Color(0xFFB7BAB8),
//                                    fontWeight: FontWeight.w400,
//                                  ),
//                                ),
//
//
//                               itemCount: onBoard.length,
//                               controller: PageControl,
//                               physics: const BouncingScrollPhysics(),
//                               onPageChanged: (int index){
//                                 if (index == onBoard.length-1) {
//                                   setState(() {
//                                     isLast = true;
//                                   });
//                                 }else {
//                                   setState(() {
//                                     isLast = false;
//                                   });
//                                 }
//                               },
//                             ),
//                             // child: ListView.builder(
//                             //   itemCount: onBoard.length ,
//                             //   itemBuilder: (context, index) =>  Text(onBoard[index].text,
//                             //
//                             //     style: GoogleFonts.tajawal(
//                             //       fontSize: 20.sp,
//                             //       height: 1.3,
//                             //       color: const Color(0xFFB7BAB8),
//                             //       fontWeight: FontWeight.w400,
//                             //     ),
//                             //   ),
//                             // ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 30.h,
//                           left: 20.w,
//                           right: 20.w,
//                           child: defaultButton(
//                             text: isLast ? 'ابدأ الان' : 'التالي',
//                             context: context,
//                             toPage: (){
//
//                               if (isLast){
//                                 submit();
//                               } else {
//                                 PageControl.nextPage(duration: const Duration(
//                                   milliseconds: 750,
//                                 ),
//                                   curve: Curves.fastOutSlowIn,);
//                               }
//
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//                 ],
//               ),
//         ),
//
//
//
//
//            ),
//
//     );
//   }
//
//   Widget onBoardBuilder(OnBoardingModel model) => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//
//
//     ],
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:venus/core/components/components.dart';
import 'package:venus/core/components/consts.dart';

import '../HomePage/home_page.dart';

class OnBoardingModel {
  final String image;
  final String text;

  OnBoardingModel({
    required this.image,
    required this.text,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  late PageController pageController2;
  late bool isLast;

  List<OnBoardingModel> onBoard = [
    OnBoardingModel(
      image: 'assets/images/camera1.png',
      text:
      'مرحبًا بكم في موقعنا المتخصص في تصوير الحفلات وتصميم ومونتاج و الأفلام الوثائقية وتصوير المطاعم والمناسبات.',
    ),
    OnBoardingModel(
      image: 'assets/images/camera2.png',
      text: 'نحن فخورون بدعوتكم لاكتشاف خدماتنا المتميزة في عالم التصوير والإنتاج الفني. في موقعنا',
    ),
    OnBoardingModel(
      image: 'assets/images/camera3.png',
      text:
      'هنا حيث يلتقي الإبداع بالاحتراف، والجودة بالفن. ',
    ),
  ];

  void submit() {
    navigateToFinish(context, const HomePage());
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController2 = PageController();
    isLast = false;
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 809.h,
                  ),
                  Container(
                    height: 530.h,
                    child: PageView.builder(
                      itemBuilder: (context, index) => Image(
                        fit: BoxFit.fill,
                        image: AssetImage(onBoard[index].image),
                      ),
                      itemCount: onBoard.length,
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (index == onBoard.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0.h,
                    child: Stack(
                      children: [
                        Container(
                          height: 316.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: secondColorLines,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 32.h,
                          left: 155.w,
                          child: SmoothPageIndicator(
                            controller: pageController,
                            effect: const ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              activeDotColor: primaryColor,
                              expansionFactor: 3,
                              spacing: 5.0,
                              dotHeight: 10.0,
                              dotWidth: 10.0,
                            ),
                            count: onBoard.length,
                          ),
                        ),
                        Positioned(
                          top: 68.h,
                          right: 20.w,
                          child: Text(
                            'فينوس',
                            style: GoogleFonts.tajawal(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 112.h,
                          right: 20.w,
                          left: 31.w,
                          child: Container(
                            height: 50.h,
                            child: PageView.builder(
                              itemBuilder: (context, index) => Text(
                                onBoard[index].text,
                                style: GoogleFonts.tajawal(
                                  fontSize: 20.sp,
                                  height: 1.3,
                                  color: const Color(0xFFB7BAB8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              itemCount: onBoard.length,
                              controller: pageController2,
                              // pageController,
                              physics: const BouncingScrollPhysics(),
                              onPageChanged: (int index) {
                                if (index == onBoard.length - 1) {
                                  setState(() {
                                    isLast = true;
                                  });
                                } else {
                                  setState(() {
                                    isLast = false;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30.h,
                          left: 20.w,
                          right: 20.w,
                          child: defaultButton(
                            text: isLast ? 'ابدأ الان' : 'التالي',
                            context: context,
                            toPage: () {
                              if (isLast) {
                                submit();
                              } else {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.fastOutSlowIn,
                                );
                                pageController2.nextPage(
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onBoardBuilder(OnBoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [],
  );
}