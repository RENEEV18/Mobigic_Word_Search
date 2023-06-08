import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/controller/search_controller/search_controller.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.gridData,
    required this.columns,
  });

  final dynamic gridData;
  final dynamic columns;
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
                    TextField(
                      controller: value.searchController,
                      onChanged: (data) {
                        value.onChanged(data);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search Text',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        value.searchWord(value.searchText, gridData, columns);
                      },
                      child: const Text('Search'),
                    ),
                    const SizedBox(height: 16.0),
                    value.isTextFound
                        ? const Text(
                            'Text found in grid!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'Text not found',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
