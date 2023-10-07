import 'package:http/http.dart' as http;

Future<bool> checkUrl(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (e) {
    return false; // An error occurred or status code is not 200
  }
}
