import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> postFloats(double latitude, double longitude) async {
    final url = Uri.parse('$baseUrl/your-endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'locations': [latitude, longitude]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to post data: ${response.body}');
    }
  }
}
