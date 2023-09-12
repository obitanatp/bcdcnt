// class Album {
//   String name;
//   String url;

//   Album({required this.name, required this.url});
// }

// class Data {
//   Song? data;
//   Data({ this.data});
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       data: json['data'] != null ? Song.fromJson(json['data']) : null,
//     );
//   }
// }

// class Song{
//   Photo? song;
//   Song({ this.song});
//   factory Song.fromJson(Map<String, dynamic> json) {
//     return Song(
//       song: json['song'] != null ? Photo.fromJson(json['song']) : null,
//     );
//   }
// }

// class Photo {
//   final String? id;
//   final String? title;
//   final String? content;
//   final Thumbnail? thumbnail;
//   final File? file;

//   Photo({
//      this.id,
//      this.title,
//      this.content,
//      this.thumbnail,
//      this.file,
//   });

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       id: json['id'] ?? null,
//       title: json['title'] ?? null,
//       content: json['content'] ?? null,
//       thumbnail: json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null,
//       file: json['file'] != null ? File.fromJson(json['file']) : null,
//     );
//   }
// }

// class File {
//   final String? video_url;
//   final String? audio_url;

//   File({
//      this.audio_url,
//      this.video_url,
//   });

//   factory File.fromJson(Map<String, dynamic> json) {
//     return File(
//       audio_url: json['audio_url'] ?? null,
//       video_url: json['video_url'] ?? null,
//     );
//   }
// }

// class Thumbnail {
//   final String? url;

//   Thumbnail({ this.url});

//   factory Thumbnail.fromJson(Map<String, dynamic> json) {
//     return Thumbnail(
//       url: json['url'] ?? null,
//     );
//   }
// }
