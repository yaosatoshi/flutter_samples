import 'package:http/http.dart' as http;

class HttpAccess {
  Future<String> get() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    print("httpGet called. /url:$url");
    final response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    return response.body;
  }

  Future<String> put() async {
    const url = 'https://httpbin.org/put';
    print("httpPut called. /url:$url");
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = '{"name":"FlutterSample"}';
    final response = await http.put(url, headers: headers, body: body);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    return response.body;
  }
}
