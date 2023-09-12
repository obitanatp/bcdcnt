import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pj/app/config/app_colors.dart';
import 'package:pj/presentation/pages/splash/splash_page.dart';

class ConnectFailPage extends StatelessWidget {
  const ConnectFailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight, bottom: 0),
        width: double.infinity,
        height: double.infinity,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/background.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
        child: Container(
          padding: EdgeInsets.only(top: heightScreen / 3),
            child: Column(children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: widthScreen,
                      child: Center(
                        child: Text(
                          "Kết nối mạng thất bại",
                          overflow: TextOverflow.ellipsis,
                          style:  GoogleFonts.raleway(
                                                        textStyle: TextStyle(
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: heightScreen / 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: CupertinoButton(
                      pressedOpacity: 0.65,
                      color: AppColors.pink,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Thử lại sau",
                                style: GoogleFonts.raleway(
                                                        textStyle: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPressed: () async {
                        Get.off(() => SplashPage());
                      },
                    )
                  )
                ]
              )
            )
          )
        );
  }
}
