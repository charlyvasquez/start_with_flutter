import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJlMjc0MjFiNy0wNDgyLTRlN2MtYjBhZS0xZDczYzA3MzE1MjgiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY2OTkzMjM5NywiZXhwIjoxNjcwNTM3MTk3fQ.xnCn4ssgNBAjMEQ0SheVDIeruwGYnwK4A9HMTdJwOxU";

Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

  return json.decode(httpResponse.body)['roomId'];
}
