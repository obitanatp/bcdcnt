import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pj/app/config/app_colors.dart';
import 'package:pj/presentation/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
   const SplashPage({super.key});

  @override
  
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/background_splash.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      child: 
                      // controller.animation.value >= 1
                      // ? 
                      Column(
                          children: [
                            Image.asset(
                              'assets/images/banner.png',
                              width: controller.animation.value * 276,
                              height: controller.animation.value * 276,
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child:
                            Text(
                              'Âm nhạc trong sự phát triển liền mạch của dân tộc',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),)
                          ],
                        )
                      // :Image.asset(
                      //   'assets/images/logo.png',
                      //   width: controller.animation.value * 130,
                      //   height: controller.animation.value * 50,
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
