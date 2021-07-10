import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        drawer: MyDrawer(),
        body: Material(
          child: Center(
            child: Text('Catalog app'),
          ),
        ));
  }
}
