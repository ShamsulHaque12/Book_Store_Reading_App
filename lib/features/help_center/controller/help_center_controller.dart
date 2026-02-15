import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HelpCenterController extends GetxController {
  final List<Map<String, dynamic>> helpCategories = [
    {
      'title': 'Payment & Purchase',
      'icon': Icons.payment,
      'ans': 'To purchase a book, go to the book details and click "Buy Now". You can pay via Bkash, Nagad, or Card. Once payment is confirmed, the book will be added to your library.'
    },
    {
      'title': 'Reading Issues',
      'icon': Icons.menu_book,
      'ans': 'If you face issues while reading, try clearing the app cache or restart the app. Ensure your internet is stable for downloading offline content.'
    },
    {
      'title': 'Free Books Access',
      'icon': Icons.card_giftcard,
      'ans': 'Free books are available in the "Free Section". You can read them directly without any payment. Some free books might require a login to track your progress.'
    },
    {
      'title': 'Refunds',
      'icon': Icons.assignment_return,
      'ans': 'Refunds are only applicable if the book is not accessible after purchase. Please contact support within 24 hours of purchase for refund requests.'
    },
    {
      'title': 'Account & Security',
      'icon': Icons.person_outline,
      'ans': 'Keep your password strong and do not share your login credentials. You can enable two-factor authentication from the settings for extra security.'
    },
  ];
}