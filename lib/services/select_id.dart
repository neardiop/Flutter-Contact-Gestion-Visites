import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchDataPersonnel(int id) async {
  final response = await http.get('http://192.168.43.8/fluttertest/selectId.php?id=$id');
  return json.decode(response.body);
}