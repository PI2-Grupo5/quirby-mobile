import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getDeviceInfo() async {
  final response = await http.get(Uri.parse('http://localhost:8080/robot/10'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
