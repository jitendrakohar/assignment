import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:assignment1/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();

    return Obx(
      () {
        if (homeViewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        final posts = homeViewModel.popularPosts;
        return RefreshIndicator(
          onRefresh: () => homeViewModel.refreshPopularPost(),
          child: ListView.builder(
            // addAutomaticKeepAlives: true,
            key: PageStorageKey('PopularPostsList'),
            controller: homeViewModel.popularScrollController,
            itemCount: homeViewModel.popularPosts.length +
                (homeViewModel.isLoadingMorePopular.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == homeViewModel.popularPosts.length &&
                  homeViewModel.isLoadingMorePopular.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return PostCard(post: posts[index]);
            },
          ),
        );
      },
    );
  }
}


