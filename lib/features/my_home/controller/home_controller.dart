import 'package:book_store/features/my_home/model/discover_model.dart';
import 'package:book_store/features/my_home/model/favourite_model.dart';
import 'package:book_store/features/my_home/model/genre_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final modelData = <DiscoverModel>[].obs;
  final genreModelData = <GenreModel>[].obs;
  final favouriteData = <FavouriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addModelData();
    addGenreModelData();
    addFavouriteModelData();
  }

  /// Discover model data add......................................................
  void addModelData() {
    modelData.addAll([
      DiscoverModel(
        title: 'Atomic Habits',
        image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
        price: '৳450',
        rate: '4.8',
      ),
      DiscoverModel(
        title: 'Rich Dad Poor Dad',
        image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
        price: '৳380',
        rate: '4.6',
      ),
      DiscoverModel(
        title: 'The Psychology of Money',
        image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
        price: '৳420',
        rate: '4.7',
      ),
      DiscoverModel(
        title: 'Think and Grow Rich',
        image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
        price: '৳390',
        rate: '4.5',
      ),
      DiscoverModel(
        title: 'Deep Work',
        image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
        price: '৳410',
        rate: '4.6',
      ),
      DiscoverModel(
        title: 'The Power of Now',
        image: 'https://m.media-amazon.com/images/I/71+N6ZJj1FL.jpg',
        price: '৳360',
        rate: '4.4',
      ),
    ]);
  }

  void removeFromDiscover(int index) {
    modelData.removeAt(index);
  }

  /// Genre model data add......................................................
void addGenreModelData() {
  genreModelData.addAll([
    GenreModel(
      title: 'Action',
      image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
    ),
    GenreModel(
      title: 'Adventure',
      image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
    ),
    GenreModel(
      title: 'Comedy',
      image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
    ),
    GenreModel(
      title: 'Drama',
      image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
    ),
    GenreModel(
      title: 'Fantasy',
      image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
    ),
    GenreModel(
      title: 'Romance',
      image: 'https://m.media-amazon.com/images/I/81OthjkJBuL.jpg',
    ),
    GenreModel(
      title: 'Thriller',
      image: 'https://m.media-amazon.com/images/I/81eB+7+CkUL.jpg',
    ),
    GenreModel(
      title: 'Inspiration',
      image: 'https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg',
    ),
    GenreModel(
      title: 'Sci-Fi',
      image: 'https://m.media-amazon.com/images/I/81XyFZ3+vXL.jpg',
    ),
    GenreModel(
      title: 'Horror',
      image: 'https://m.media-amazon.com/images/I/81b+gI7h2wL.jpg',
    ),
    GenreModel(
      title: 'Mystery',
      image: 'https://m.media-amazon.com/images/I/91J3V9C7pQL.jpg',
    ),
    GenreModel(
      title: 'Psychology',
      image: 'https://m.media-amazon.com/images/I/71hA6lbEKJL.jpg',
    ),
    GenreModel(
      title: 'Comics',
      image: 'https://m.media-amazon.com/images/I/91crvB9+siL.jpg',
    ),
    GenreModel(
      title: 'Children\'s',
      image: 'https://m.media-amazon.com/images/I/81YOuOGFCJL.jpg',
    ),
    GenreModel(
      title: 'Art & Photography',
      image: 'https://m.media-amazon.com/images/I/81G+uWjR3PL.jpg',
    ),
    GenreModel(
      title: 'Biography',
      image: 'https://m.media-amazon.com/images/I/81vpsIs58WL.jpg',
    ),
  ]);
}

/// Favourite model data .......................................................
  void addFavouriteModelData() {
    favouriteData.addAll([
      FavouriteModel(
        title: 'Atomic Habits',
        image: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
        price: '৳450',
        rate: '4.8',
      ),
      FavouriteModel(
        title: 'Rich Dad Poor Dad',
        image: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
        price: '৳380',
        rate: '4.6',
      ),
      FavouriteModel(
        title: 'The Psychology of Money',
        image: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
        price: '৳420',
        rate: '4.7',
      ),
      FavouriteModel(
        title: 'Think and Grow Rich',
        image: 'https://m.media-amazon.com/images/I/71UypkUjStL.jpg',
        price: '৳390',
        rate: '4.5',
      ),
      FavouriteModel(
        title: 'Deep Work',
        image: 'https://m.media-amazon.com/images/I/71HMyqG6MRL.jpg',
        price: '৳410',
        rate: '4.6',
      ),
      FavouriteModel(
        title: 'The Power of Now',
        image: 'https://m.media-amazon.com/images/I/71+N6ZJj1FL.jpg',
        price: '৳360',
        rate: '4.4',
      ),
    ]);
  }

  void removeFromFavourite(int index) {
    favouriteData.removeAt(index);
  }

}
