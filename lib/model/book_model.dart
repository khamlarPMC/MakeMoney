import 'package:hive/hive.dart';
part 'book_model.g.dart';

@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String cost;
  @HiveField(2)
  final int type;
  @HiveField(3)
  final String time_date;
  BookModel(
    this.name,
    this.cost,
    this.type,
    this.time_date,
  );
}
