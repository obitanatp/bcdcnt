import 'package:pj/app/usecases/pram_usecase.dart';
import 'package:pj/domain/entities/data.dart';
import 'package:pj/domain/repositories/song_repository.dart';

class SongUseCase extends ParamUseCase<Data, int> {
  SongUseCase(this.songRepository);

  final SongRepository songRepository;

  @override
  Future<Data> execute(params) {
    return songRepository.get(params);
  }
}
