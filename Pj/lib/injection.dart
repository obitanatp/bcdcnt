import 'package:get/get.dart';
import 'package:pj/app/services/local_storage.dart';

class DependencyCreator {
  static init() {}

  static initServices() async {
    await Get.putAsync(() => LocalStorageService().init());
  }
}
