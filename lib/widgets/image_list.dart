import 'package:flutter/material.dart';
import 'package:flutter_simple_api_app/core/model/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, int index) {
          return buildImage(images[index]);
        },
        itemCount: images.length,
      ),
    );
  }

  Padding buildImage(ImageModel image) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (new Image.network(image.url)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(image.title),
                )
              ],
            ),
          ),
        );
  }
}
