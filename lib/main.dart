import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imapp/features/history/presentation/views/history_view.dart';
import 'core/constants/boxes.dart';
import 'features/history/data/models/image_data.dart';

void main() async {
  // initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ImageDataAdapter());
  // open the box
  imageBox = await Hive.openBox<ImageData>("imageBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Processing Analysis App',
      home: HistoryView()
    );
  }
}

