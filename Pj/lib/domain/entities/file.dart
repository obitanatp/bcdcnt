class File {
  File({
    this.video_url,
    this.audio_url,
  });

  String? video_url;
  String? audio_url;

  factory File.fromJson(
      Map<String, dynamic>? json) {
    return File(
      video_url: json?['video_url'] == null ? null : json?['video_url'] as String,
      audio_url: json?['audio_url'] == null ? null : json?['audio_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'video_url': video_url,
        'audio_url': audio_url,
      };
}
