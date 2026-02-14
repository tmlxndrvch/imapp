import 'package:flutter/material.dart';
import 'package:imapp/features/home/presentation/views/home_view.dart';

import 'features/result/presentation/views/result_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeView()
    );
  }
}

