// import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastCachedImage(
        url: image,
        fit: fit,
        width: width,
        height: height,
        fadeInDuration: const Duration(milliseconds: 500),
        errorBuilder: (context, exception, stacktrace) {
          return Image.asset("assets/placeholder.png");
        },
        loadingBuilder: (context, progress) {
          debugPrint(
              'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
          return Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (progress.isDownloading && progress.totalBytes != null)
                  Text(
                      '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                      style: const TextStyle(color: Colors.red)),
                SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                        color: Colors.red,
                        value: progress.progressPercentage.value)),
              ],
            ),
          );
        });
  }
}

//  CachedNetworkImage(
//       imageUrl: image,
//       placeholder: (context, url) =>
//           const Center(child: CircularProgressIndicator()),
//       errorWidget: (context, url, error) => Image.asset(
//         'assets/placeholder.jpg',
//         fit: BoxFit.cover,
//       ),
//       fit: fit,
//       width: width,
//       height: height,
//     );