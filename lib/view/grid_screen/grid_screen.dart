import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/view/search_screen/search_screen.dart';

class GridScreen extends StatelessWidget {
  final int rows;
  final int columns;
  final List<String> gridData;

  const GridScreen({
    super.key,
    required this.rows,
    required this.columns,
    required this.gridData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Word Search Grid',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: gridData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
            color: Colors.white,
            child: Center(
              child: Text(
                gridData[index],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(
                columns: columns,
                gridData: gridData,
              ),
            ),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
