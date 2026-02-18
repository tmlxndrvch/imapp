import 'package:hive/hive.dart';

part 'image_data.g.dart';

@HiveType(typeId: 1)
class ImageData {

  ImageData({required this.id, required this.type, required this.filePath, required this.date});
  @HiveField(0)
  String id;

  @HiveField(1)
  String type;

  @HiveField(2)
  String filePath;

  @HiveField(3)
  String date;

}