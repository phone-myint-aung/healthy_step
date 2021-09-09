import 'package:hive/hive.dart';

part 'daily_steps.g.dart';

@HiveType(typeId: 1)
class DailyStep extends HiveObject {
  @HiveField(0)
  late int step;
}