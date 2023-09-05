import "dart:convert";

import "package:code_union_test/config/urls.dart";
import "package:http/http.dart" as http;

class HttpController {
  onLogin(String login, String password) async {
    try {
      // HTTP запрос авторизации
      final request = await http.post(Uri.parse(urlLogin),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({"email": login, "password": password}));
      if (request.statusCode == 200) {
        String bodyBytes = utf8.decode(request.bodyBytes);
        final extractedData = json.decode(bodyBytes) as Map<String, dynamic>;
        return extractedData;
      } else {
        return request.body;
      }
    } catch (e) {
      throw e;
    }
  }
}
