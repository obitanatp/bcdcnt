import 'package:pj/domain/entities/song.dart';

class Data {
  Data({
    this.data,
  });

  Song? data;

  factory Data.fromJson(
      Map<String, dynamic>? json) {
    return Data(
      data: json?['data'] == null
          ? null
          : Song.fromJson(json?['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
