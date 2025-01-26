import 'package:assignment1/model/HiveAdapter.dart';
import 'package:assignment1/model/post_model.dart';
import 'package:assignment1/utils/ToastUtils.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductCacheManager {
  static const _featureBox = 'featureProductsBox';
  static const _popularBox = 'popularProductsBox';
  static const _topBox = 'topProductsBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PostModelAdapter());
  }

  // Open boxes
  static Future<Box<PostModel>> _openFeatureBox() async =>
      await Hive.openBox<PostModel>(_featureBox);

  static Future<Box<PostModel>> _openPopularBox() async =>
      await Hive.openBox<PostModel>(_popularBox);

  static Future<Box<PostModel>> _openTopBox() async =>
      await Hive.openBox<PostModel>(_topBox);

  /// Save products to a specific box
  static Future<void> saveFeatureProducts(List<PostModel> products) async {
    final box = await _openFeatureBox();
    await box.clear();
    await box.addAll(products);
  }

  static Future<void> savePopularProducts(List<PostModel> products) async {
    final box = await _openPopularBox();
    await box.clear();
    await box.addAll(products);
  }

  static Future<void> saveTopProducts(List<PostModel> products) async {
    final box = await _openTopBox();
    await box.clear();
    await box.addAll(products);
  }

  /// Retrieve products from a specific box
  static Future<List<PostModel>> getFeatureProducts() async {
    final box = await _openFeatureBox();
    return box.values.toList();
  }

  static Future<List<PostModel>> getPopularProducts() async {
    final box = await _openPopularBox();
    return box.values.toList();
  }

  static Future<List<PostModel>> getTopProducts() async {
    final box = await _openTopBox();
    return box.values.toList();
  }

  /// Clear all boxes
  static Future<void> clearAllCaches() async {
    final featureBox = await _openFeatureBox();
    final popularBox = await _openPopularBox();
    final topBox = await _openTopBox();
    await featureBox.clear();
    await popularBox.clear();
    await topBox.clear();
  }
}
