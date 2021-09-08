import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserName extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double weight;
  @HiveField(2)
  late double height;
  @HiveField(3)
  late bool isSIUnit;
  @HiveField(4)
  late bool isMale;
}