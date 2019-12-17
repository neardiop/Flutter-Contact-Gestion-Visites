import 'dart:convert';
import 'package:app_lonase/util/user_credentials.dart';
import 'package:http/http.dart' as http;
import 'package:dbcrypt/dbcrypt.dart';

Future<List> fetchAuthenticatedUser(UserCredentials credentials) async {
  final response =
      await http.post('http://192.168.43.8/fluttertest/login.php', body: {
    "email": credentials.getEmail
  });
//    "password":
//        new DBCrypt().hashpw(credentials.getPassword, new DBCrypt().gensalt())

  if (response.statusCode >= 200) {
    try {
      //I didn't check if there are more than one same email because, our db schema
      //for users table email column is unique.
      for(var user in json.decode(response.body)) {
        var isCorrect = new DBCrypt().checkpw(
            credentials.getPassword, user['password']);
        if (isCorrect)
          return json.decode(response.body);
      }
    } catch (e) {
      return [];
    }
  }
  return [];
}
