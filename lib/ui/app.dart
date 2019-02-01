import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_simple_api_app/core/model/image_model.dart';
import 'package:flutter_simple_api_app/widgets/image_list.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            child: counter > 0 ? ImageList(images) : Text('5 Images')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchImage(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
