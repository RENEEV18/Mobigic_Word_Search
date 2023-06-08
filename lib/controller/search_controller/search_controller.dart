import 'package:flutter/material.dart';

class SearchBoxController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';
  bool isTextFound = false;

  void searchWord(String word, List<String> gridData, int columns) {
    isTextFound = gridData.join('').contains(word);
    notifyListeners();
  }

  void onChanged(data) {
    searchText = data;
    notifyListeners();
  }
}
