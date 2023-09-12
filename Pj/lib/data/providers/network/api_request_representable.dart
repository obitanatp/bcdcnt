import 'package:get/get_connect/http/src/multipart/form_data.dart';

enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

abstract class APIRequestRepresentable {
  FormData get form;
  String get url;
  String get endpoint;
  String get path;
  HTTPMethod get method;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
  dynamic get body;
  Future request();
}

abstract class APIGraphQLRequestRepresentable {
  String get query;
  String get url;
  String get endpoint;
  String get path;
  Map<String, dynamic> get variables;
  Map<String, String> get headers;
  Future request();
}