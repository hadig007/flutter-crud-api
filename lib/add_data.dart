import 'package:crud_flutter_3/repository.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    Repository _repository = Repository();
    TextEditingController idBuku = TextEditingController();
    TextEditingController judul = TextEditingController();
    TextEditingController penulis = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: idBuku,
              decoration: InputDecoration(labelText: "ID Buku"),
            ),
            TextField(
              controller: judul,
              decoration: InputDecoration(labelText: "Judul Buku"),
            ),
            TextField(
              controller: penulis,
              decoration: InputDecoration(labelText: "Penulis"),
            ),
            ElevatedButton(
              onPressed: () async {
                bool response = await _repository.postData(
                    idBuku.text, judul.text, penulis.text);
                    if(response){
                      Navigator.of(context).popAndPushNamed('/home');
                    }else{
                      print("post data gagal");
                    }
              },
              child: Text("Tambah"),
            )
          ],
        ),
      ),
    );
  }
}
