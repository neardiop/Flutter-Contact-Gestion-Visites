import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchDataVisit() async {
  final response = await http.get('http://192.168.43.8/fluttertest/upcomming_visit.php');
  return json.decode(response.body);
}

Future<List> fetchDataVisitPast() async {
  final response = await http.get('http://192.168.43.8/fluttertest/past_visit.php');
  return json.decode(response.body);
}

Future<List> fetchDataVisitEnCours() async {
  final response = await http.get('http://192.168.43.8/fluttertest/visite_encours.php');
  return json.decode(response.body);
}