# cached_network_image_builder

A tiny widget to cache your network image with downloading it via using basic http request and check it if it has already stored, so doesn't need to download it again.

## How to use

```dart
HiveListener(
  box: Hive.box('settings'),
  keys: ['dark_theme'], // keys is optional to specify listening value changes
  builder: (box) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: box.get('dark_theme', defaultValue: false) ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  },
)
 ```# cached_network_image_builder
