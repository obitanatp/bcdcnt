import 'package:pj/domain/entities/photo.dart';

class Song {
  Song({
    this.song,
  });

  Photo? song;

  factory Song.fromJson(
      Map<String, dynamic>? json) {
    return Song(
      song: json?['song'] == null
          ? null
          : Photo.fromJson(json?['song']),
    );
  }

  Map<String, dynamic> toJson() => {
        'song': song,
      };
}
