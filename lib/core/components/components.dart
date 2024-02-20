import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'consts.dart';



Future navigateTo(
    BuildContext context,
    Widget widget,
    ) =>
    Navigator.of(context).push( PageTransition(
          type: PageTransitionType.leftToRight,
          child: widget,
        ),);


Future navigateToFinish(
    BuildContext context,
    Widget widget,
    ) =>
    Navigator.of(context).pushAndRemoveUntil( PageTransition(
      type: PageTransitionType.leftToRight,
      child: widget,

    ),

(route) {
          return false;
        }
    );

PreferredSizeWidget appBarDefaultTheme({
  required BuildContext context,
  required bool isReverse  ,
  required String title,
  List<Widget>? actions,
}) => AppBar(
  elevation: 5.0,
  centerTitle: true,
  titleTextStyle: GoogleFonts.tajawal(

    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color:  Colors.black,
  ),

  backgroundColor: Colors.white,
  leading: isReverse  ? IconButton(
    icon:
    const Icon(Icons.arrow_back_ios,color: Colors.black,),
    onPressed: (){
      Navigator.pop(context);
      // ClinicCubit.get(context).clearData();
    },
  ) : Container(),
  title: Text(title!),
  actions: actions,

);
Widget defaultButton(
    {
      required BuildContext context,
      required String text,
      required Function() toPage}) =>
    MaterialButton(
      onPressed: toPage,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: 60.h,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),

      color: primaryColor,
      child:  Text(
        textAlign : TextAlign.center,
        text,

        style:  GoogleFonts.cairo(
            color: secondColorLines,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold

        ),
      ),
    );



Widget defaultButtonBlack(
    {
      required BuildContext context,
      required String text,
      required Function() toPage}) =>
    MaterialButton(
      onPressed: toPage,
      padding: EdgeInsets.symmetric(vertical: 13.h),
      height: 60.h,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      color: secondColorLines,
      child:  Text(
        textAlign : TextAlign.center,
        text,

        style:  GoogleFonts.tajawal(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700

        ),
      ),
    );

Widget defaultTextFormFeild(
    context, {
      required TextInputType keyboardType,
      required String? Function(String?) validate,
      String? hint,
      required String label,

      Function()? onpressed,
      bool secure = false,
      FocusNode? focusNode,
      void Function()? onTap,
      void Function(String)? onSubmit,
      void Function(String)? onChanged,
      TextEditingController?  controller,
      bool? enabled ,
    }) =>
    TextFormField(
      focusNode: focusNode != null ? focusNode : null,
      controller: controller,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: secure,
      keyboardType: keyboardType,
      validator: validate,
      enabled: enabled != null ? enabled : true,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 1),

        // constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 18 ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        border: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(14),
        ),



        hintText: hint,
        labelText: label,
        alignLabelWithHint: true,

        labelStyle: GoogleFonts.tajawal(
          fontSize: 16.sp,
          color: const Color(0xff606F7B),

        ),
      ),
    );
// Widget searchTextField({
//   required Function(String)? search,
//   required Function()? onTap ,
//   required Function(PointerDownEvent)? onTapOutside ,
//   required Function(String?)? onSaved ,
//   required BuildContext context,
// }) =>  TextFormField(
//
//   onChanged:  search,
//   onTap: onTap,
//   onTapOutside: onTapOutside,
//   onSaved: onSaved ,
//   decoration: InputDecoration(
//     filled: true,
//
//     fillColor: fillRectangular,
//     labelText: 'بحث',
//
//     labelStyle: GoogleFonts.tajawal(
//
//       fontSize: 16.sp,
//
//       color: const Color(0xff606F7B),
//     ),
//
//     enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: fillRectangular)),
//     border: OutlineInputBorder(
//         borderSide: const BorderSide(
//
//             color: fillRectangular),
//
//         borderRadius: BorderRadius.circular(8)),
//
//     contentPadding: EdgeInsets.symmetric(horizontal: 26.w),
//
//     prefixIconConstraints: const BoxConstraints(
//       minHeight: 24,
//       minWidth: 24,
//     ),
//
//     suffixIconConstraints: const BoxConstraints(
//       minHeight: 24,
//       minWidth: 24,
//     ),
//     suffixIcon: Padding(
//       padding:  EdgeInsets.only(left: 16.0.w),
//       child: InkWell(
//           onTap: ()
//           {
//
//             navigateTo(context, Test());
//           },
//           child: SvgPicture.asset('assets/images/lets-icons_filter.svg')),
//     ),
//     prefixIcon: Padding(
//       padding:  EdgeInsets.only(right: 16.0.w, left: 16.0.w),
//       child: SvgPicture.asset(
//
//
//           'assets/images/material-symbols-light_search.svg'),
//     ), ///temporary
//
//   ), );

//
// PreferredSizeWidget appBarDefaultTheme({
//   required BuildContext context,
//   String? title,
//   List<Widget>? actions,
// }) => AppBar(
//   elevation: 0.0,
//   centerTitle: true,
//   titleTextStyle: GoogleFonts.tajawal(
//
//     fontSize: 16.sp,
//     fontWeight: FontWeight.bold,
//     color:  Colors.black,
//   ),
//
//   backgroundColor: Colors.white,
//   leading: IconButton(
//     icon: SvgPicture.asset('assets/images/arrow.svg',),
//     onPressed: (){
//       Navigator.pushReplacement(context, SliderLeft(page: const HomePage(), ));
//       ClinicCubit.get(context).clearData();
//     },
//   ),
//   title: Text(title!),
//   actions: actions,
//
// );