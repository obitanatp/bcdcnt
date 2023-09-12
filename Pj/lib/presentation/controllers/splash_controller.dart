import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pj/presentation/controllers/network_controller.dart';
import 'package:pj/presentation/pages/init/init_page.dart';
import 'package:pj/presentation/pages/splash/connect_fail_page.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
    Future.delayed(const Duration(seconds: 2), () async {
      final connect = Get.put(GetXNetworkManager());
      await recurve(connect);
    });
  }

  recurve(connect) async {
    if (connect.isInitialized.value == true) {
      if (connect.connectionType != 0) {
          Get.off(() => InitPage());
      } else {
        Get.off(() => const ConnectFailPage());
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 100), () {});
      await recurve(connect);
    }
  }
}
