# cached_network_image_builder

A widget to cache your network image with downloading it via using basic http request and check it if it has already stored, so doesn't need to download it again.

Thanks to [pixabay](https://pixabay.com/) for free images.

### Important note:

- The packages will download the image only once, which means it doesn't listen for changes on the server after downloading it.

## How to use

- Basic usage:

```dart
CachedNetworkImageBuilder(
    url: "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
    builder: (imageFile) {
        return Center(child: Image.file(imageFile));
    },
),
```

- More customized usage:

```dart
CachedNetworkImageBuilder(
    url: "misformatted_url_or_url_that_doesn't_contain_image",
    builder: (image) {
        return Center(child: Image.file(image));
    },
    // Optional Placeholder widget until image loaded from url
    placeHolder: LinearProgressIndicator(),
    // Optional error widget
    errorWidget: Image.asset('assets/images/error_image.png'),
    // Optional describe your image extensions default values are; jpg, jpeg, gif and png
    imageExtensions: ['jpg', 'png'],
),
```
