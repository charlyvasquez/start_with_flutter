import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UsersEndpoint {
  Future<List<Map<String, dynamic>>> getDataUsers() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      List<dynamic> mapData = jsonDecode(data.body);
      return mapData.map<Map<String, dynamic>>((getData) => getData).toList();
    } else {
      return [
        {'error': data.reasonPhrase}
      ];
    }
  }
}
