import 'package:crud_flutter_3/add_data.dart';
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
  List<BukuModel> bukus = [];
  Repository repository = Repository();

  getdata() async {
    bukus = await repository.getdata();
    setState(() {});
  }

  @override
  void initState() {
    getdata();

    super.initState();
  }

  // void pindahLayar(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => AddData(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'add_data': (context) => AddData(),
        '/home': (context) => HomePage(bukus: bukus)
      },
      home: HomePage(bukus: bukus),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    required this.bukus,
  }) : super(key: key);

  final List<BukuModel> bukus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).popAndPushNamed('add_data'),
      ),
      appBar: AppBar(
        title: Text("CRUD 3"),
      ),
      // ignore: unnecessary_null_comparison
      body: (bukus.length == null)
          ? Text("loading")
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bukus[index].judul),
                  subtitle: Text("penulis : " + bukus[index].penulis),
                  leading: Text("ID : " + bukus[index].id.toString()),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: bukus.length),
    );
  }
}
