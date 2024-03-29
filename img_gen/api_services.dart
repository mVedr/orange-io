import 'dart:convert';
import 'package:contact_state_app/.env';
import 'package:http/http.dart' as http;
import 'package:contact_state_app/img_gen/api_key.dart';

// API Model for OpenAI's API
/* API Token has now expired...So the response will be "No data found!!!" */
class Api {
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");

  static final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $ENV_API_KEY"
  };

  static generateImage(String text, String size) async {
    var res = await http.post(url,
        headers: headers,
        body: jsonEncode({"prompt": text, "n": 1, "size": size}));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      return data['data'][0]['url'].toString();
    } else {
      return "No data found!!!";
    }
  }
}
