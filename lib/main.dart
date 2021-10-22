import 'package:crud_flutter_3/model.dart';
import 'package:crud_flutter_3/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <BukuModel> bukus = [];
  Repository repository = Repository();

  getdata() async {
    bukus = await repository.getdata();
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CRUD 3"),
        ),
        body: ListView.separated(itemBuilder: (context, index){
          return Container(child: Text(bukus[index].judul),);
        }, separatorBuilder: (context, index){
          return Divider();
        }, itemCount: bukus.length),
      ),
    );
  }
}
