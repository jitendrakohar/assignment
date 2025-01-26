import 'package:assignment1/model/post_model.dart';
import 'package:assignment1/utils/CacheService.dart';
import 'package:assignment1/utils/ToastUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class HomeViewModel extends GetxController {
  final ApiService _apiService;

  HomeViewModel(this._apiService);

  late ScrollController topScrollController;
  late ScrollController popularScrollController;
  late ScrollController featuredScrollController;
  @override
  void onInit() async {
    fetchAllData();
    super.onInit();
    initScrollControllerAndAttachListener();
  }

  initScrollControllerAndAttachListener() {
    topScrollController = ScrollController();
    popularScrollController = ScrollController();
    featuredScrollController = ScrollController();
    topScrollController.addListener(_topScrollListener);
    popularScrollController.addListener(_popularScrollListener);
    featuredScrollController.addListener(_featuredScrollListener);
  }

  @override
  void onClose() {
    topScrollController.dispose();
    popularScrollController.dispose();
    featuredScrollController.dispose();
  }

  _featuredScrollListener() {
    if (featuredScrollController.position.pixels >=
            featuredScrollController.position.maxScrollExtent &&
        !isLoadingMoreFeature.value) {
      fetchMoreFeaturePosts();
    }
  }

  _popularScrollListener() {
    if (popularScrollController.position.pixels >=
            popularScrollController.position.maxScrollExtent &&
        !isLoadingMorePopular.value) {
      fetchMorePopularPosts();
    }
  }

  void _topScrollListener() {
    if (topScrollController.position.pixels >=
            topScrollController.position.maxScrollExtent &&
        !isLoadingMoreTop.value) {
      fetchMoreTopPosts(); // Trigger pagination
    }
  }

  fetchAllData() async {
    await fetchTopPosts(1);
    await fetchPopularPosts(1);
    await fetchFeaturedPosts(1);
  }

  // Reactive lists for posts
  RxList<PostModel> topPosts = <PostModel>[].obs;
  RxList<PostModel> popularPosts = <PostModel>[].obs;
  RxList<PostModel> featuredPosts = <PostModel>[].obs;

  // Reactive boolean for loading state
  RxBool isLoading = false.obs;
  RxBool isLoadingMoreTop = false.obs;
  RxBool isLoadingMorePopular = false.obs;
  RxBool isLoadingMoreFeature = false.obs;
  RxInt pageNoTop = 1.obs;
  RxInt pageNoPopular = 1.obs;
  RxInt pageNoFeatured = 1.obs;

  /// Fetch more posts for pagination
  Future<void> fetchMoreTopPosts() async {
    if (isLoadingMoreTop.value) return;
    isLoadingMoreTop.value = true;
    pageNoTop.value++;
    await fetchTopPosts(pageNoTop.value);
    isLoadingMoreTop.value = false;
  }

  Future<void> refreshTopPost() async {
    topPosts.assignAll([]);
    fetchTopPosts(1);
  }

  /// Fetch top posts
  Future<void> fetchTopPosts(int page) async {
    try {
      isLoading.value = true; // Set loading state
      final posts = await _apiService.getTopPosts(
        10,
        page,
        "id,created_at,created_at_in_millis,image_medium,comments_count,store{name}",
      );
      pageNoTop = page.obs;
      topPosts.addAll(posts);
      ProductCacheManager.saveTopProducts(topPosts);
    } catch (e) {
      Get.snackbar("Loading Failed",
          "Failed to fetch, Please check your Internet connection");
      topPosts.value = await ProductCacheManager.getTopProducts();
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  /// Fetch more posts for pagination
  Future<void> fetchMorePopularPosts() async {
    if (isLoadingMorePopular.value) return;
    isLoadingMorePopular.value = true;
    pageNoPopular.value++;
    await fetchPopularPosts(pageNoPopular.value);
    isLoadingMorePopular.value = false;
  }

  Future<void> refreshPopularPost() async {
    popularPosts.assignAll([]);
    fetchPopularPosts(1);
  }

  /// Fetch popular posts
  Future<void> fetchPopularPosts(int page) async {
    try {
      isLoading.value = true;
      final posts = await _apiService.getPopularPosts(
        10,
        page,
        "id,created_at,created_at_in_millis,image_medium,comments_count,store{name}",
      );

      pageNoPopular = page.obs;
      popularPosts.addAll(posts);
      // ToastUtil.showToast(
      //     "Fetched ${posts.length} featured posts: ${popularPosts.length}");

      ProductCacheManager.savePopularProducts(popularPosts);
    } catch (e) {
      Get.snackbar("Loading Failed",
          "Failed to fetch, Please check your Internet connection");
      popularPosts.value = await ProductCacheManager.getPopularProducts();
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch more posts for pagination
  Future<void> fetchMoreFeaturePosts() async {
    if (isLoadingMoreFeature.value) return;
    isLoadingMoreFeature.value = true;
    await fetchFeaturedPosts(pageNoFeatured.value++);
    isLoadingMoreFeature.value = false;
  }

  Future<void> refreshFeaturedPost() async {
    featuredPosts.assignAll([]);
    fetchFeaturedPosts(1);
  }

  /// Fetch featured posts
  Future<void> fetchFeaturedPosts(int page) async {
    try {
      isLoading.value = true;
      final posts = await _apiService.getFeaturedPosts(
        10,
        page,
        "id,created_at,created_at_in_millis,image_medium,comments_count,store{name}",
      );
      featuredPosts.addAll(posts);

      // ToastUtil.showToast(
      //     "Fetched ${posts.length} featured posts: ${featuredPosts.length}");

      ProductCacheManager.saveFeatureProducts(featuredPosts);
    } catch (e) {
      Get.snackbar("Loading Failed",
          "Failed to fetch, Please check your Internet connection");
      featuredPosts.value = await ProductCacheManager.getFeatureProducts();
    } finally {
      isLoading.value = false;
    }
  }
}
