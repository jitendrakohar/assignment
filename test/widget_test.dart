import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:assignment1/services/api_service.dart';
import 'package:assignment1/model/post_model.dart';
import 'package:assignment1/utils/CacheService.dart';

class MockApiService extends Mock implements ApiService {}

class MockProductCacheManager extends Mock implements ProductCacheManager {}

void main() {
  late HomeViewModel homeViewModel;
  late MockApiService mockApiService;
  late MockProductCacheManager mockCacheManager;

  setUp(() {
    mockApiService = MockApiService();
    mockCacheManager = MockProductCacheManager();
    homeViewModel = HomeViewModel(mockApiService);
  });

  group('HomeViewModel Tests', () {
    test('fetchTopPosts should add posts to the list', () async {
      final mockTopPosts = [
        PostModel(
          id: 1,
          createdAt: '2022-01-01',
          createdAtInMillis: 1640995200000,
          imageMedium: 'image_url',
          commentsCount: 10,
          store: Store(name: 'Store 1'),
        ),
      ];
    });
  });
}
