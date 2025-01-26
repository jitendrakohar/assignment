import 'package:assignment1/utils/ToastUtils.dart';
import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:assignment1/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:assignment1/utils/ToastUtils.dart';
import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:assignment1/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();

    return Obx(() {
      if (homeViewModel.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      final posts = homeViewModel.topPosts;

      return RefreshIndicator(
        onRefresh: () async {
          await homeViewModel.refreshTopPost();
        },
        child: ListView.builder(
          key: PageStorageKey('topPostsList'),
          addAutomaticKeepAlives: true,
          controller: homeViewModel
              .topScrollController, // Use the controller from ViewModel
          itemCount: homeViewModel.topPosts.length +
              (homeViewModel.isLoadingMoreTop.value ? 1 : 0),

          itemBuilder: (context, index) {
            if (index == homeViewModel.topPosts.length &&
                homeViewModel.isLoadingMoreTop.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return PostCard(key: PageStorageKey(index), post: posts[index]);
          },
        ),
      );
    });
  }
}

