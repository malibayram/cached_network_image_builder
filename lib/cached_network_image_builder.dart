library cached_network_image_builder;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class CachedNetworkImageBuilder extends StatelessWidget {
  final String url;
  final List<String> imageExtensions;
  final Widget placeHolder;
  final Widget errorWidget;
  final Widget Function(File image) builder;

  const CachedNetworkImageBuilder({
    Key key,
    @required this.url,
    this.imageExtensions,
    this.placeHolder,
    this.errorWidget,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Future<String>.microtask(() async {
        RegExp ieRegEx = RegExp(
          imageExtensions != null
              ? imageExtensions.map((e) => "(.${e.replaceAll(RegExp('[. ]'), '')})").join("|")
              : "(.jpg)|(.jpeg)|(.gif)|(.png)",
        );

        String imageName = url.split('/').last;
        Directory directory = await getApplicationDocumentsDirectory();

        Directory folderDirectory = Directory(directory.path + '/cached_images/');

        if (!folderDirectory.existsSync()) await folderDirectory.create(recursive: true);

        Directory imageDirectory = Directory(folderDirectory.path + imageName);

        if (folderDirectory.listSync().toString().contains(imageDirectory.path)) {
          return imageDirectory.path;
        } else if (url.startsWith(RegExp("http(s)?://")) && url.contains(ieRegEx)) {
          Response response = await get(url);
          if (response.statusCode == 200) {
            if (response.headers['content-type'].startsWith('image')) {
              File file = File(imageDirectory.path);
              file.writeAsBytesSync(response.bodyBytes);
              return imageDirectory.path;
            } else
              return ":error: url does not contain image";
          } else
            return ":error: Failed to load image : statusCode: ${response.statusCode}";
        } else
          return ":error: unknown error occured";
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          if (snapshot.data.startsWith(":error:"))
            return errorWidget ?? Center(child: Text(snapshot.data));
          else
            return builder(File(snapshot.data));
        } else
          return placeHolder ?? Center(child: CircularProgressIndicator());
      },
    );
  }
}
