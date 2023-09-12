import 'package:pj/data/providers/network/apis/song_api.dart';
import 'package:pj/domain/entities/data.dart';
import 'package:pj/domain/repositories/song_repository.dart';

class SongRepositoryImpl extends SongRepository {

  @override
  Future<Data> get(int id) async {
    final response = await SongAPI.get(id).request();
    print(response);
    return Data.fromJson(response);
  }
}