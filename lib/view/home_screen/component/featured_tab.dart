import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:assignment1/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();

    return Obx(() {
      if (homeViewModel.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      final posts = homeViewModel.featuredPosts;
      return RefreshIndicator(
        onRefresh: () => homeViewModel.refreshFeaturedPost(),
        child: ListView.builder(
          key: PageStorageKey('FeaturedPostsList'),
          controller: homeViewModel.featuredScrollController,
          itemCount: homeViewModel.featuredPosts.length -
              (homeViewModel.isLoadingMorePopular.value ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == homeViewModel.featuredPosts.length &&
                homeViewModel.isLoadingMoreFeature.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return PostCard(post: posts[index]);
          },
        ),
      );
    });
  }
}
