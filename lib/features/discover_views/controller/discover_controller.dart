import 'package:book_store/features/discover_views/model/top_categories_model.dart';
import 'package:book_store/features/discover_views/model/top_new_release_model.dart';
import 'package:book_store/features/discover_views/model/top_selling_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final searchController = TextEditingController();
  final topCategories = <TopCategoriesModel>[].obs;
  final topSell = <TopSellingModel>[].obs;
  final topRelease = <TopNewReleaseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    topCategoriesData();
    topSellerData();
    topReleaseData();
  }

  /// Top categories data add......................................................
  void topCategoriesData() {
    topCategories.assignAll([
      TopCategoriesModel(
        title: 'Atomic Habits',
        image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
        price: '৳450',
        rate: '4.8',
      ),
      TopCategoriesModel(
        title: 'Rich Dad Poor Dad',
        image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
        price: '৳380',
        rate: '4.6',
      ),
      TopCategoriesModel(
        title: 'The Psychology of Money',
        image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
        price: '৳420',
        rate: '4.7',
      ),
      TopCategoriesModel(
        title: 'Think and Grow Rich',
        image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
        price: '৳390',
        rate: '4.5',
      ),
      TopCategoriesModel(
        title: 'Deep Work',
        image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
        price: '৳400',
        rate: '4.6',
      ),
    ]);
  }

  void removeTopCategories(int index) {
    topCategories.removeAt(index);
  }

  /// Top Seller data add.........................................................
  void topSellerData() {
    topSell.addAll([
      TopSellingModel(
        title: 'Atomic Habits',
        image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
        price: '৳450',
        rate: '4.8',
      ),
      TopSellingModel(
        title: 'Rich Dad Poor Dad',
        image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
        price: '৳380',
        rate: '4.6',
      ),
      TopSellingModel(
        title: 'The Psychology of Money',
        image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
        price: '৳420',
        rate: '4.7',
      ),
      TopSellingModel(
        title: 'Think and Grow Rich',
        image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
        price: '৳390',
        rate: '4.5',
      ),
      TopSellingModel(
        title: 'Deep Work',
        image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
        price: '৳400',
        rate: '4.6',
      ),
    ]);
  }

  void removeTopSell(int index) {
    topSell.removeAt(index);
  }

  /// Top New Release data add ...................................................
  void topReleaseData() {
    topRelease.addAll([
      TopNewReleaseModel(
        title: 'Atomic Habits',
        image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
        price: '৳450',
        rate: '4.8',
      ),
      TopNewReleaseModel(
        title: 'Rich Dad Poor Dad',
        image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
        price: '৳380',
        rate: '4.6',
      ),
      TopNewReleaseModel(
        title: 'The Psychology of Money',
        image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
        price: '৳420',
        rate: '4.7',
      ),
      TopNewReleaseModel(
        title: 'Think and Grow Rich',
        image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
        price: '৳390',
        rate: '4.5',
      ),
      TopNewReleaseModel(
        title: 'Deep Work',
        image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
        price: '৳400',
        rate: '4.6',
      )
    ]);
  }

  void removeTopRelease(int index) {
    topRelease.removeAt(index);
  }
}
