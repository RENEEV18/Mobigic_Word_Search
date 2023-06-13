import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/view/grid_screen/grid_screen.dart';
import 'package:mobigic_test_apk/view/splash_screen/splash_screen.dart';

class HomeController extends ChangeNotifier {
  final TextEditingController rowsController = TextEditingController();
  final TextEditingController columnsController = TextEditingController();
  final TextEditingController gridDataController = TextEditingController();
  var gridData;
  final formKey = GlobalKey<FormState>();

  void gridValue(row, column) {
    gridData = List.generate(
        row, (i) => List.filled(column, "", growable: false),
        growable: false);
    notifyListeners();
  }

  void onButtonPressed(context) {
    int rows = int.tryParse(rowsController.text) ?? 0;
    int columns = int.tryParse(columnsController.text) ?? 0;

    if (rows > 0 && columns > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GridScreen(
            rows: rows,
            columns: columns,
            // gridData: gridData.split(' '),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter valid grid dimensions and data.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    notifyListeners();
  }

  void resetApp(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const SplashScreen();
        },
      ),
    );
    rowsController.clear();
    columnsController.clear();
    // gridDataController.clear();
    notifyListeners();
  }
}
