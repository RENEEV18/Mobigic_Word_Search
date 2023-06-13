import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/view/widgets/searchHightlight.dart';

class SearchBoxController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';
  List serchList = [];
  bool isTextFound = false;

  void searchWord(String word, List<String> gridData, int columns) {
    isTextFound = gridData.join('').contains(word);
    notifyListeners();
  }

  void onChanged(data) {
    searchText = data;
    notifyListeners();
  }

  void searchButton(gridData, columns, rows) {
    serchList = searchLogicList(gridData, searchText, rows, columns);
    notifyListeners();
  }
}
