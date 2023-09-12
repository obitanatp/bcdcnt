class Thumbnail {
  Thumbnail({
    this.url,
  });

  String? url;

  factory Thumbnail.fromJson(
      Map<String, dynamic>? json) {
    return Thumbnail(
      url: json?['url'] == null ? null : json?['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
