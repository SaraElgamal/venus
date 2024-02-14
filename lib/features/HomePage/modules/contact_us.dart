import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/cubit.dart';
import 'package:venus/features/HomePage/modules/offers/offer_logic/state.dart';
import 'package:venus/features/appCubit/cubit.dart';

import '../../../core/components/components.dart';
import '../../../core/components/consts.dart';
import '../../appCubit/state.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>
    with TickerProviderStateMixin{
  bool checkAnimated = false ;
  bool checkAnimatedMessage = false ;


  var formKey = GlobalKey<FormState>();

  var name = TextEditingController();

  var email = TextEditingController();

  var phone = TextEditingController();

  var message = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _animationControllerMessage;
  late Animation<double> _animationMessage;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationControllerMessage = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );


    _animation = Tween<double>(begin: 300.0, end: 1.0).animate(_animationController)
      ..addStatusListener((state) {


      })..addListener(() {
        setState(() {

        });
      });
    _animationMessage = Tween<double>(begin: 300.0, end: 1.0).animate(_animationControllerMessage)
      ..addStatusListener((state) {


      })..addListener(() {
        setState(() {

        });
      });

    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerMessage.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var call = AppCubit.get(context);
    final Uri urlface = Uri.parse(OffersCubit
        .get(context)
        .footer![0].facebook
        .toString(),);
    final Uri urltwitt = Uri.parse(OffersCubit
        .get(context)
        .footer![0].twitter
        .toString(),);
    final Uri urltube = Uri.parse(OffersCubit
        .get(context)
        .footer![0].youtube
        .toString(),);
    final Uri urlinsta = Uri.parse(OffersCubit
        .get(context)
        .footer![0].instagram
        .toString(),);
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: OffersCubit.get(context).offers!.isNotEmpty ?
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: SingleChildScrollView(
              child: BlocBuilder<AppCubit,AppStates>(
                builder:  (context, state) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        Text('الاسم',
                          style:  GoogleFonts.tajawal(
                         color: secondColorLines,
                         fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                       ), ),
                        SizedBox(
                          height: 10.h,
                        ),
                        defaultTextFormFeild(
                          context,
                          controller: name,
                          validate: (value) {
                            if (value == null || value == '') {
                              return 'لا يمكن ترك هذا الحقل فارغا';
                            }
                          },
                          label: 'ادخل الاسم',
                          // hint: 'الاسم الاول',
                          keyboardType: TextInputType.name,
                          suffix: Container(),
                        ),
                        SizedBox(height: 24.h),
                        Text('البريد الالكتروني',style:  GoogleFonts.tajawal(
                          color: secondColorLines,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ), ),
                        SizedBox(
                          height: 10.h,
                        ),
                        defaultTextFormFeild(
                          context,
                          suffix: Container(),
                          controller: email,
                          validate: (value) {
                            if (value == null || value == '') {
                              return 'لا يمكن ترك هذا الحقل فارغا';
                            }
                            if (!value.contains('@')) {
                              return 'هذا ليس بريد الكتروني صالح';
                            }
                          },
                          label: 'البريد الالكتروني',
                          // hint: 'البريد الالكتروني',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 24.h),
                        Text('الهاتف المحمول',style:  GoogleFonts.tajawal(
                          color: secondColorLines,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ), ),
                        SizedBox(
                          height: 10.h,
                        ),
                        defaultTextFormFeild(
                          context,

                          validate: (value) {
                            if (value == null || value == '') {
                              return 'لا يمكن ترك هذا الحقل فارغا';
                            }
                            if (value.length < 11 ) {
                              return 'من فضلك يجب أن يكون رقم الهاتف صالحا';
                            }
                          },
                          controller: phone,
                          label: 'الهاتف المحمول',
                          // hint: 'رقم التيلفون',
                          keyboardType: TextInputType.phone,
                          suffix: Container(),
                        ),
                        SizedBox(height: 24.h),
                        Text('نص الرساله',style:  GoogleFonts.tajawal(
                          color: secondColorLines,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ), ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(

                          keyboardType: TextInputType.multiline,
                          minLines: 5, // Set this
                          maxLines: 6,
                          controller: message,
                          decoration: InputDecoration(

                            hintText: 'ادخل رسالتك',

                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 10.w),
                            border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: const Color(0xff606F7B),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),
                        BlocConsumer<OffersCubit, OffersStates>(
                          listener: (context, state) {
                            if (state is PostMessageSuccessState ) {
                              setState(() {
                                name.text = '';
                                email.text = '';
                                phone.text = '';
                                message.text = '';
                              });
                            }
                          },
                          builder: (context, state) {

                            if (state is PostMessageLoadingState ){return

                              Center(child: Lottie.asset(

                                'assets/animation/Animation - 1705103164209.json',
                                height: 80.h,
                                width: double.infinity,
                              ));


  } else {
                              return    defaultButton(
                                  context: context,
                                  text: 'ارسال',
                                  toPage: () {
                                    if (formKey.currentState!.validate()) {
                                      OffersCubit.get(context).postDetails(
                                        name: name.text,
                                        email: email.text,
                                        phone: phone.text,
                                        message: message.text,
                                      );
                                    }
                                  });
                            }
    }

                        ),

                        SizedBox(height: 10.h),
                        OffersCubit.get(context).footer!.isNotEmpty ?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (BuildContext context, Widget? child) =>  Row(
                              children: [
                                InkWell(
                                  onTap: ()
                                  {
                                    setState(() {
                                      checkAnimated = ! checkAnimated;
                                      checkAnimated ? _animationController.forward() : _animationController.reverse();
                                    });
                                  },
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: SvgPicture.asset(
                                      fit: BoxFit.none,
                                      'assets/images/contact.svg',
                                      color: secondColorLines,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w,),
                                Flexible(child: Transform.translate(

                                    offset: Offset(_animation.value,0.0),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${OffersCubit.get(context).footer![0].phone1.toString()} / ${OffersCubit.get(context).footer![0].phone2.toString()}',style: GoogleFonts.cairo(fontSize: 16.sp,color: secondColorLines),),
                                        Text(
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,

                                          '${OffersCubit.get(context).footer![0].address.toString()} / ${OffersCubit.get(context).footer![0].timing.toString()}',style: GoogleFonts.cairo(fontSize: 16.sp,color: secondColorLines),),
                                      ],
                                    ))),

                              ],
                            ),
                          ),
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
                        SizedBox(height: 15.h),
                        OffersCubit.get(context).footer!.isNotEmpty ?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedBuilder(
                            animation: _animationControllerMessage,
                            builder: (BuildContext context, Widget? child) =>  Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      checkAnimatedMessage = ! checkAnimatedMessage;
                                      checkAnimatedMessage ? _animationControllerMessage.forward() : _animationControllerMessage.reverse();
                                    });

                                  },
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: SvgPicture.asset(
                                      fit: BoxFit.none,
                                      'assets/images/whowe.svg',
                                      color: secondColorLines,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w,),
                                Flexible(child: Transform.translate(
                                    offset: Offset(_animationMessage.value,0.0),
                                    child: Row(
                                      children: [

                                        InkWell(
                                          onTap: ()
                                          {
                                            launchUrl(urlface);
                                          },
                                          child:
                                        SvgPicture.asset(
                                          height: 40.h,width: 40.w,
                                          fit: BoxFit.cover,
                                          'assets/images/facebook.svg',

                                        ),),
                                        SizedBox(width: 10.w,),
                                        InkWell(
                                          onTap: ()
                                          {
                                            launchUrl(urlinsta);
                                          },
                                          child:
                                        SvgPicture.asset(
                                          height: 40.h,width: 40.w,
                                          fit: BoxFit.cover,
                                          'assets/images/insta.svg',
                                          color: Colors.purple,

                                        ),),
                                        SizedBox(width: 10.w,),
                                        InkWell(
                                          onTap: ()
                                          {
                                            launchUrl(urltwitt);
                                          },
                                          child:
                                        SvgPicture.asset(
                                          height: 40.h,width: 40.w,
                                          fit: BoxFit.cover,
                                          'assets/images/twitter.svg',

                                        ),),
                                        SizedBox(width: 10.w,),
                                        InkWell(
                                          onTap: ()
                                          {
                                            launchUrl(urltube);
                                          },
                                          child: SvgPicture.asset(
                                            height: 40.h,width: 40.w,
                                            fit: BoxFit.cover,
                                            'assets/images/tube.svg',

                                          ),
                                        ),

                                      ],
                                    ),
                                ),
                                ),
                              ],
                            ),),
                        ) :  Container(
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
                        SizedBox(height: 20.h,),
                      ],
                    ),
              ),
            ),
          ) : Container(
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
      ),
    );


  }

}
