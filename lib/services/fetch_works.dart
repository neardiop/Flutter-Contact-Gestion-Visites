import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchData() async {
  final response = await http.get('http://192.168.43.8/fluttertest/myworks.php');
  return json.decode(response.body);
}