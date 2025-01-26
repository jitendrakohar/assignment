import 'dart:ffi';

import 'package:assignment1/services/api_service.dart';
import 'package:assignment1/view/home_screen/component/featured_tab.dart';
import 'package:assignment1/view/home_screen/component/popular_tab.dart';
import 'package:assignment1/view/home_screen/component/top_tab.dart';
import 'package:assignment1/viewModels/home_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeViewModel>(HomeViewModel(
      ApiService(
        Dio(),
      ),
    ));
    return GetBuilder<HomeViewModel>(
      builder: (controller) {
        return Scaffold(
          appBar: null,
          body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue.shade800,
                title: Text(
                  "Deals",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                centerTitle: false,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 4.0,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade300,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      text: "Top",
                    ),
                    Tab(text: "Popular"),
                    Tab(text: "Featured"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  TopTab(),
                  PopularTab(),
                  FeaturedTab(),
                ],
              ),
              drawer: Drawer(
                backgroundColor: Colors.blue,
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Container(
                          color: Colors.blue,
                          child: Text(
                            "Assignment",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: Colors.white),
                          )),
                    ),
                    ListTile(
                      title: Text("Dummy Item 1"),
                    ),
                    ListTile(
                      title: Text("Dummy Item 2"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.fetchTopPosts(1);
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.add_shopping_cart),
          ),
        );
      },
    );
  }
}
