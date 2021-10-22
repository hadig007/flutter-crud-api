import 'dart:convert';

import 'package:crud_flutter_3/model.dart';
import 'package:http/http.dart' as http;

class Repository{
  final _baseUrl = "http://192.168.1.3:8000/api/bukus";

  Future getdata() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List <BukuModel> buku = it.map((e) => BukuModel.fromJson(e)).toList();
        return buku;
        // return jsonEncode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}