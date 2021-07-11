import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'dart:convert';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items!.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items![index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
