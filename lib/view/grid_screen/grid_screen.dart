import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/controller/home_controller/home_controller.dart';
import 'package:mobigic_test_apk/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class GridScreen extends StatelessWidget {
  final int rows;
  final int columns;
  // final List<String> gridData;

  const GridScreen({
    super.key,
    required this.rows,
    required this.columns,
    // required this.gridData,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false)
          .gridValue(rows, columns);
    });
    return Consumer<HomeController>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Word Search Grid',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: value.formKey,
              child: Column(
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rows,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: rows * columns,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            initialValue: value.gridData[
                                    index - ((index / rows).floor() * rows)]
                                [(index / rows).floor()],
                            onChanged: (data) {
                              value.gridData[
                                      index - ((index / rows).floor() * rows)]
                                  [(index / rows).floor()] = data;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      if (value.formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => SearchScreen(
                                  columns: columns,
                                  row: rows,
                                  gridData: value.gridData,
                                )),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Form Grid Result",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
