import 'dart:async';

import 'package:hive_flutter/adapters.dart';
import 'package:makemoney/model/wallet_model.dart';

import '../constants/hive_box.dart';

typedef RegisterAdapter = void Function<T>(
  TypeAdapter<T> adapter, {
  bool internal,
  bool override,
});

class LocalDatabaseService {
  LocalDatabaseService._();

  static final instance = LocalDatabaseService._();

  FutureOr<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(WalletAdapter());
  //   Hive.registerAdapter(BorrowerAdapter());
  //  Hive.registerAdapter(UserTakeModeAdapter());
    // await FutureOr.wait(
    //   [

    //   ],
    // );
    // await Hive.openBox<Device>(HiveBox.devices.name);
    // await Hive.openBox<Borrower>(HiveBox.borrowers.name);
    //  await Hive.openBox<UserTakeMode>(HiveBox.user.name);
  }

  /// ### added data into specific box base on type you put
  ///
  /// [T] is model
  ///
  /// [hiveBox] is box, you want to interact with
  ///
  /// [data] is new data to add to the box
  FutureOr<void> add<T>(HiveBox hiveBox, T data) async {
    final box = Hive.box<T>(hiveBox.name);
    await box.add(data);
  }

  /// ### Update data by index
  ///
  /// [T] is model
  ///
  /// [hiveBox] is box, you want to interact with
  ///
  /// [data] is new data to udpate to the box
  ///
  /// [index] is position you to update
  FutureOr<void> putAt<T>(HiveBox hiveBox, int index, T data) async {
    final box = Hive.box<T>(hiveBox.name);
    await box.putAt(index, data);
  }

  /// ### Delete data by index
  ///
  /// [T] is model
  ///
  /// [hiveBox] is box, you want to interact with
  ///
  /// [index] is position you to delete
  FutureOr<void> deleteAt<T>(HiveBox hiveBox, int index) async {
    final box = Hive.box<T>(hiveBox.name);
    await box.deleteAt(index);
  }

  /// ### Get data by index
  ///
  /// [T] is model
  ///
  /// [hiveBox] is box, you want to interact with
  ///
  /// [index] is position you to get
  T? getAt<T>(HiveBox hiveBox, int index) {
    final box = Hive.box<T>(hiveBox.name);
    return box.getAt(index);
  }
}
