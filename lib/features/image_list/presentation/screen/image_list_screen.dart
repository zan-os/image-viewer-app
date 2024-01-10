import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_cubit.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_state.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(child: BlocBuilder<ImageListCubit, ImageListState>(
            builder: (context, state) {
          if (state is LoadingState) {
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.amber,
                      ),
                      const Text('Loading')
                    ],
                  );
                },
              ),
            );
          }
          if (state is SuccessState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.imageList.length,
              itemBuilder: (context, index) {
                if (state.imageList.isEmpty) {
                  return const Text('No Data');
                }
                final image = state.imageList[index];

                return SizedBox(
                  width: 200,
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: image.url,
                    width: 200,
                    height: 200,
                    maxHeightDiskCache: 200,
                    maxWidthDiskCache: 200,
                  ),
                );
              },
            );
          }
          if (state is ErrorState) {
            return Text(state.message);
          }
          return const SizedBox.shrink();
        })),
      ),
    );
  }
}
