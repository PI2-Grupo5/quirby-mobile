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

Future<void> updateFunctionMode(String functionMode) async {
  final response = await http.put(
    Uri.parse('http://localhost:8080/robot/10'),
    headers: {"Content-Type": "application/json"},
    body: json.encode({'functionMode': functionMode})
  );

  if (response.statusCode == 200) {
    print('Successfully updated functionMode to $functionMode');
  } else {
    throw Exception('Failed to update functionMode');
  }
}
