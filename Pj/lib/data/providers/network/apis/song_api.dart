import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';


class SongAPI implements APIGraphQLRequestRepresentable {
  int? id;

  SongAPI._({this.id});

  SongAPI.get(int id) : this._(id: id);

  // @override
  // FormData get form {
  //   return FormData({
  //   });
  // }

  @override
  String get endpoint => APIEndpoint.endpointTest;

  @override
  String get path {
    return "/graphql";
  }

  @override
  String get url => endpoint + path;

  // @override
  // HTTPMethod get method {
  //   return HTTPMethod.post;
  // }

  @override
  Map<String, String> get headers => {"Content-Type": "application/json"};

  @override
  String get query => 'query(\$id: ID!) {\n song(id: \$id) {\nid\ntitle\nsubtitle\nslug\ncontent\nviews\ndownloads\nfile_type\nlyric_type\nstatus\nyear\nrecord_year\nallow_comment\ncreated_at\nartists(first: 10, orderBy: [{column: "song_artist.order", order: ASC}]) {\ndata {\nid\ntitle\nslug\navatar {\nurl\n}\n}\n}\ncomposers(first: 10, orderBy: [{column: "song_composer.order", order: ASC}]) { \n data { \n id\n title\n slug\n }\n }\n poets(first: 10) {\n data {\nid\n  title\n slug\n  }\n }\n thumbnail {\n url\n user {\n id\n username\navatar {\nurl\n}\n}\n}\nfile {\nvideo_url\naudio_url\n }\n uploader {\n id\n username\n avatar {\nurl\n}\n}\ndocuments(first: 10) {\ndata {\nid\ntitle\nslug\nthumbnail {\n url\n}\n}\n}\n}\n}';

  @override
  Map<String, dynamic> get variables => { "id" : id };

  // @override
  // get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}
