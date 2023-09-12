// import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
// import 'package:get/get_connect/http/src/response/response.dart';

// class GraphQLResponseALT<T> extends Response<T> {
//   final List<GraphQLError>? graphQLErrors;
//   GraphQLResponseALT({T? body, this.graphQLErrors}) : super(body: body);
//   GraphQLResponseALT.fromResponse(Response res)
//       : graphQLErrors = null,
//         super(
//             request: res.request,
//             statusCode: res.statusCode,
//             bodyBytes: res.bodyBytes,
//             bodyString: res.bodyString,
//             statusText: res.statusText,
//             headers: res.headers,
//             // body: res.body['data'] as T?
//             body: res.body);
// }