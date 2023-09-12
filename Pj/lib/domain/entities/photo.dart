import 'package:pj/domain/entities/file.dart';
import 'package:pj/domain/entities/thumbnail.dart';

class Photo {
  Photo({
    this.id,
    this.title,
    this.content,
    this.thumbnail,
    this.file,
  });

    String? id;
    String? title;
    String? content;
    Thumbnail? thumbnail;
    File? file;

  factory Photo.fromJson(
      Map<String, dynamic>? json) {
    return Photo(
      id: json?['id'] == null ? null : json?['id'] as String,
      title: json?['title'] == null ? null : json?['title'] as String,
      content: json?['content'] == null ? null : json?['content'] as String,
      thumbnail: json?['thumbnail'] == null ? null : Thumbnail.fromJson(json?['thumbnail']),
      file: json?['file'] == null ? null : File.fromJson(json?['file']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'thumbnail': thumbnail,
        'file': file
      };
}
