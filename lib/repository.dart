import 'dart:convert';

import 'package:crud_flutter_3/model.dart';
import 'package:http/http.dart' as http;

class Repository{
  final getUrl = "http://192.168.1.3:8000/api/bukus";
  final postUrl = "http://192.168.1.3:8000/api/create_buku";

  Future getdata() async {
    try {
      final response = await http.get(Uri.parse(getUrl),);

      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List <BukuModel> buku = it.map((e) => BukuModel.fromJson(e)).toList();
        print(buku);
        return buku;
        // return jsonEncode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String idBuku, String judul, penulis) async {
    try {
      final response = await http.post(Uri.parse(postUrl),body: {
        'id_buku' : idBuku,
        'judul_buku': judul,
        'penulis' : penulis
    });

    if(response.statusCode == 200){
      print("berhasil");
      return true;
    }else{
      print("gagal");
      return false;
    }
    } catch (e) {
      print(e.toString());
    }
  }
}