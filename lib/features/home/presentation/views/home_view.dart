import 'package:flutter/material.dart';
import 'package:imapp/features/home/presentation/widgets/add_image_button_widget.dart';
import 'package:imapp/features/home/presentation/widgets/processed_image_info_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1a1a24),
        floatingActionButton: AddImageButtonWidget(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ImageFlow",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 200),
              ProcessedImageInfoWidget()
            ],
          ),
        ),
      ),
    );
  }


}
