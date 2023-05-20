import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:makemoney/model/book_model.dart';
import 'package:makemoney/model/wallet_model.dart';
import 'package:makemoney/services/local_database_service.dart';

import 'constants/hive_box.dart';
import 'home/home_screen.dart';

FutureOr<void> main() async {
  await LocalDatabaseService.instance.initialize();
  // create object FlutterLocalNotificationsPlugin

  BookModel bookData = BookModel("", "", 1, "");
  // add vehicle
  final box = Hive.box<BookModel>(HiveBox.book.name);
  await box.add(bookData);
  // get vehicle
  final getVehicle = await box.getAt(0);
  print("First Vehicle $getVehicle");
  // update vehicle
  BookModel newVehicle = BookModel(
      bookData.name, bookData.cost, bookData.type, bookData.time_date);
  await box.putAt(0, newVehicle);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
