import 'package:pj/domain/entities/data.dart';

abstract class SongRepository {
  Future<Data> get(int id);
}
