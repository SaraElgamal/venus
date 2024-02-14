import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus/core/components/consts.dart';
import 'package:venus/features/appCubit/cubit.dart';
import 'package:venus/features/appCubit/state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) =>  Scaffold(
        backgroundColor: Colors.white,
        body: cubit.screens[cubit.currentIndex] ,
        bottomNavigationBar:  BottomNavigationBar(
          unselectedItemColor: const Color(0xFF9B9B9B) ,
          unselectedLabelStyle:  GoogleFonts.tajawal(
            color: const Color(0xFF9B9B9B),

          ),
          unselectedIconTheme: const IconThemeData(color: Color(0xFF9B9B9B)),
          selectedIconTheme: const IconThemeData(color: secondColorLines,),
showSelectedLabels: true,
         showUnselectedLabels: true,
         selectedItemColor: secondColorLines,

         selectedLabelStyle: GoogleFonts.tajawal(
           color: secondColorLines,

         ),
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomIndex(index);
          },
          items:  [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home.svg',
            color:  cubit.currentIndex == 0 ? secondColorLines : const Color(0xFF9B9B9B),
            ),
              label: 'الرئيسية',

            ),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/offers.svg'
            ,
              color:cubit.currentIndex == 1 ? secondColorLines : const Color(0xFF9B9B9B),
            ),
              label: 'العروض',
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/whowe.svg'
            ,
           color :   cubit.currentIndex == 2 ? secondColorLines : const Color(0xFF9B9B9B),
            ),
              label: 'من نحن',
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/contact.svg'
            ,color: cubit.currentIndex == 3 ? secondColorLines : const Color(0xFF9B9B9B),
            ),
              label: 'تواصل معنا',
            ),
          ],
        ),
      ),
    );
  }
}
