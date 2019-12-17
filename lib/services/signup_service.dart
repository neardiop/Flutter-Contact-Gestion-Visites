import 'package:app_lonase/util/user_credentials.dart';
import 'package:http/http.dart' as http;
import 'package:dbcrypt/dbcrypt.dart';

Future<bool> signupUser(UserCredentials credentials) async {
  final response = await http.post('http://192.168.43.8/fluttertest/signup.php', body: {
    "username": credentials.getUsername,
    "email": credentials.getEmail,
    "password": new DBCrypt().hashpw(credentials.getPassword, new DBCrypt().gensalt()),
    "role": "member",
  });

  if (response.statusCode >= 200) {
    return true;
  }
  return false;
}
