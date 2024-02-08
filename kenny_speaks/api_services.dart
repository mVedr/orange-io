import 'dart:convert';
import 'package:contact_state_app/.env';
import 'package:http/http.dart' as http;

class ApiServices {
  static String baseUrl = "https://api.openai.com/v1/completions";

  // header for post request
  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $ENV_API_KEY'
  };

  //Function for sending prompt data to api for fetching details
  static sendMessage(String? message) async {
    if (message != null) {
      var res = await http.post(Uri.parse(baseUrl),
          headers: header,
          body: jsonEncode({
            "model": "text-davinci-003",
            "prompt": '$message',
            "temperature": 0,
            "max_tokens": 1000,
            "top_p": 1,
            "frequency_penalty": 0.0,
            "presence_penalty": 0.0,
            "stop": ["Human", "AI:"]
          }));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        var msg = data['choices'][0]['text'];
        return msg;
      } else {
        print("Failed to fetch data ");
      }
    }
  }
}
