import 'dart:convert';

import 'package:bb_characters/constants/strings.dart';
import 'package:bb_characters/data/models/quotes.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30));
    dio = Dio(baseOptions);
  }

// Future<Map<String, dynamic>> getallcharacters() async {
//     try {
//       Uri url = Uri.parse(baseurl);
//       http.Response response = await http.get(url);
//       var res = response.body;
//       print(res);
//       return jsonDecode(res);
//     } catch (e) {
//       print(e.toString());
//       return {};
//     }
//   }
  Future<List<dynamic>> getallcharacters() async {
    try {
      Response response = await dio.get('character');
      var res = response.data['results'];
      // print(res);
      return res;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getqoute() async {
    Uri url = Uri.parse(qoutebaseurl);
    http.Response response = await http.get(url);
    // print(response.body);
    return jsonDecode(response.body);
  }
}
