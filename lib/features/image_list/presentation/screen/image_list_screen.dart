// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:unsplash_flutter/core/util/fixed_grid_delegate.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_cubit.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_state.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  ImageListCubit get bloc => context.read<ImageListCubit>();

  @override
  void initState() {
    bloc.getImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ImageListCubit, ImageListState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    addAutomaticKeepAlives: true,
                    addSemanticIndexes: true,
                    addRepaintBoundaries: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 16,
                      height: 268,
                    ),
                    itemCount: state.imageList.length,
                    itemBuilder: (context, index) {
                      final image = state.imageList[index];
                      if (state.imageList.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return GestureDetector(
                        onTap: () {
                          bloc.downloadImage(
                            url: image.rawImageUrl,
                            imageId: image.id,
                          );
                        },
                        child: ImageGridItem(
                          image: image,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

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
