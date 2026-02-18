import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imapp/features/image/presentation/widgets/document_scan_result_widget.dart';
import 'package:imapp/features/image/presentation/widgets/face_scan_result_widget.dart';

import '../../domain/image_usecase.dart';
import '../controller/image_controller.dart';


class ImagePreviewView extends StatefulWidget {
  const ImagePreviewView({super.key});

  @override
  State<ImagePreviewView> createState() => _ImagePreviewViewState();
}

class _ImagePreviewViewState extends State<ImagePreviewView> {
  final _imageController = Get.put(ImageController(ImageUseCase()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF1a1a24),
          title: Text(
            _imageController.imageType.value,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF1a1a24),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 600,
                width: double.infinity,
                child: Image(
                  image: FileImage(File(_imageController.imagePath.value)),
                  fit: BoxFit.contain,
                ),
              ),
              // FaceScanResultWidget(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Color(0xFFed6f72),
                    minWidth: double.infinity,
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
