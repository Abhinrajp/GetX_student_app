import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Studentmodel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String addNO;
  @HiveField(4)
  final String place;
  @HiveField(5)
  final String image;

  Studentmodel(
      {required this.id,
      required this.name,
      required this.age,
      required this.addNO,
      required this.place,
      required this.image});
}
