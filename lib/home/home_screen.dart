import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:makemoney/constants/hive_box.dart';
import 'package:makemoney/model/book_model.dart';

import '../services/local_database_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final now = DateTime.now();

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final costController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7FFC74),
        title: const Text(
          "MakeMoney",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder<Box<BookModel>>(
        valueListenable: Hive.box<BookModel>(HiveBox.book.name).listenable(),
        builder: (context, box, widget) {
          return Center(
            child: box.values.isEmpty
                ? const Text(
                    "Not Data",
                    style: TextStyle(fontSize: 20),
                  )
                : ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      BookModel data = box.values.toList()[index];
                      return Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 24),
                              Container(
                                width: 64,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: const Color(0xff7FFC74),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(9)),
                                child: const Image(
                                  fit: BoxFit.cover,
                                  width: 20,
                                  height: 20,
                                  image: AssetImage(
                                    'assets/images/daily1.png',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(data.name),
                              const Spacer(),
                              Text("${data.cost} KIP"),
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: () {
                                    box.deleteAt(index);
                                  },
                                  child: const Icon(Icons.delete,color: Colors.red, )),
                              const SizedBox(width: 10)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              data.time_date,
                              style: const TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ],
                      );
                    }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 460,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 150),
                          child: const Divider(
                            thickness: 3,
                            color: Color(0xffD9D9D9),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Detail",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Name"),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this is a required field';
                                          }
                                          return null;
                                        },
                                        controller: nameController,
                                        decoration: const InputDecoration(),
                                      ),
                                      const Text("Cost"),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this is a required field';
                                          }
                                          return null;
                                        },
                                        controller: costController,
                                        decoration: const InputDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: (() async {
                                if (_formKey.currentState!.validate()) {
                                  await LocalDatabaseService.instance
                                      .add<BookModel>(
                                    HiveBox.book,
                                    BookModel(nameController.text,
                                        costController.text, 1, "${now}"),
                                  );
                                  costController.clear();
                                  nameController.clear();
                                }
                                // Navigator.pop(context);
                              }),
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(6)),
                                child: const Center(child: Text("save")),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              });

          Container(
            margin: const EdgeInsets.only(left: 20, top: 8, right: 20),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffE9E9E9),
            ),
            height: 60,
            child: const Row(
              children: [
                SizedBox(width: 17),
                Icon(
                  Icons.credit_card,
                  size: 30,
                  color: Color(0xff5C5C5C),
                ),
                SizedBox(width: 15),
                Spacer(),
                Icon(Icons.arrow_drop_down),
                SizedBox(width: 15),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
