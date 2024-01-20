// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/home_cubit.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/home_state.dart';
import 'package:unsplash_flutter/registered_injection.dart';

import '../widgets/image_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  HomeCubit get cubit => sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  SafeArea _buildBody() {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<HomeCubit>()..getImageList(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return PageView.builder(
              allowImplicitScrolling: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: state.imageList.length,
              itemBuilder: (context, index) {
                final image = state.imageList[index];
                if (state.imageList.isEmpty) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    cubit.downloadImage(
                      url: image.rawImageUrl,
                      imageId: image.id,
                    );
                  },
                  child: ImageGridItem(
                    image: image,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
