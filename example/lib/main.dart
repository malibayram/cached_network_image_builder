import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            CachedNetworkImageBuilder(
              url: "misformatted_url_or_url_that_doesn't_contain_image",
              builder: (image) {
                return Center(child: Image.file(image));
              },
              // Optional Placeholder widget until image loaded from url
              placeHolder: const LinearProgressIndicator(),
              // Optional error widget
              errorWidget: Image.asset('assets/images/error_image.png'),
              // Optional describe your image extensions default values are; jpg, jpeg, gif and png
              imageExtensions: ['jpg', 'png'],
            ),
            SizedBox(height: 40),
            CachedNetworkImageBuilder(
              url:
                  "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
              builder: (image) {
                return Center(child: Image.file(image));
              },
            ),
            SizedBox(height: 40),
            CachedNetworkImageBuilder(
              url:
                  "https://cdn.pixabay.com/photo/2020/05/30/17/18/wind-power-plant-5239642_1280.jpg",
              builder: (image) {
                return Center(child: Image.file(image));
              },
            ),
          ],
        ),
      ),
    );
  }
}
