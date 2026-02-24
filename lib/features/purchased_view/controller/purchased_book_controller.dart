import 'package:book_store/features/purchased_view/model/purchases_book.dart';
import 'package:get/get.dart';

class PurchasedBookController extends GetxController {
  // বইয়ের লিস্ট (Observable)
  var books = <PurchasesBook>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() {
    var bookData = [
      PurchasesBook(
        title: "Harry Potter and the Deathly Hallows",
        imageUrl: "https://m.media-amazon.com/images/I/71Yf9N5M+GL._AC_UF1000,1000_QL80_.jpg", 
        rating: 4.9,
        status: "Purchased",
      ),
      PurchasesBook(
        title: "Harry Potter and the Half-Blood Prince",
        imageUrl: "https://m.media-amazon.com/images/I/81S0X6kS+UL._AC_UF1000,1000_QL80_.jpg",
        rating: 4.8,
        status: "Purchased",
      ),
      PurchasesBook(
        title: "Harry Potter and the Order of the Phoenix",
        imageUrl: "https://m.media-amazon.com/images/I/81S2f-vB2kL._AC_UF1000,1000_QL80_.jpg",
        rating: 4.9,
        status: "Purchased",
      ),
      PurchasesBook(
        title: "Harry Potter and the Goblet of Fire",
        imageUrl: "https://m.media-amazon.com/images/I/816nS+5q7UL._AC_UF1000,1000_QL80_.jpg",
        rating: 4.7,
        status: "Purchased",
      ),
    ];

    books.assignAll(bookData);
  }
}