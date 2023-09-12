import 'package:get/get.dart';
import 'package:pj/data/repositories/song_repository_impl.dart';
import 'package:pj/domain/usecases/song_use_case.dart';
import 'package:pj/presentation/controllers/song/song_controller.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SongRepositoryImpl());
    Get.lazyPut(() => SongUseCase(Get.find<SongRepositoryImpl>()));
    Get.lazyPut(() => SongController(Get.find()));
  }
}
