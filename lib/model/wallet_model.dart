import 'package:hive/hive.dart';
part 'wallet_model.g.dart';


@HiveType(typeId: 0)
class Wallet {
  @HiveField(0)
  final String wallet;
  @HiveField(1)
  final int income;
  @HiveField(2)
  final int expenditure;
  @HiveField(3)
  final String time_date;
  Wallet(
    this.wallet,
    this.income,
    this.expenditure,
    this.time_date,
  );
}