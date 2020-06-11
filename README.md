# cached_network_image_builder

A widget to cache your network image with downloading it via using basic http request and check it if it has already stored, so doesn't need to download it again.

Thanks to [pixabay](https://pixabay.com/) for free images.

### Important note:
- The packages will download image one time that means it doesn't listen if image changed on server after download it.

## How to use
* Basic usage:

```dart
CachedNetworkImageBuilder(
    url: "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
    builder: (image) {
    return Center(child: Image.file(image));
    },
),
 ```
* More customized usage:

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

