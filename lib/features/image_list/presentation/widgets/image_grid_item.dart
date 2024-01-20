import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../domain/entities/image_entity.dart';

class ImageGridItem extends StatelessWidget {
  const ImageGridItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageEntity image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: image.url,
                width: 200,
                height: 200,
                filterQuality: FilterQuality.high,
                memCacheHeight: 200,
                memCacheWidth: 200,
                maxWidthDiskCache: 200,
                maxHeightDiskCache: 200,
              ),
              Visibility(
                visible: image.downloading,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    value: image.downloadProgress,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              Center(
                child: Visibility(
                  visible: image.downloading,
                  child: Text(
                    (image.downloadProgress == 1.0)
                        ? 'Download Complete'
                        : 'Downloading Image',
                    style: const TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            image.user,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Gap(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            image.likes.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
