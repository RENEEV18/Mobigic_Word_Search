import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/controller/search_controller/search_controller.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.gridData,
    required this.columns,
    this.row,
  });

  final dynamic gridData;
  final dynamic columns;
  final dynamic row;
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBoxController>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Word Search'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: row,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: row * columns,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: value.serchList.contains(index)
                                      ? Colors.amber
                                      : Colors.black,
                                ),
                                child: Text(
                                  gridData[
                                          index - ((index / row).floor() * row)]
                                      [(index / row).floor()],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: value.serchList.contains(index)
                                          ? Colors.white
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CupertinoSearchTextField(
                      onChanged: (data) {
                        value.searchText = data;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        value.searchButton(gridData, columns, row);
                      },
                      child: const Text("Search"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
