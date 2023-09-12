class Album {
  Album({
    this.name,
    this.url
  });

  String? name;
  String? url;

  factory Album.fromJson(
      Map<String, dynamic>? json) {
    return Album(
      name: json?['name'] == null ? null : json?['name'] as String,
      url: json?['url'] == null ? null : json?['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url
      };
}