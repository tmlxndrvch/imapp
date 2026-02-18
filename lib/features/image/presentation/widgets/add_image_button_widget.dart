import 'dart:core' as platform;
import 'dart:core';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imapp/features/image/domain/image_usecase.dart';
import 'package:imapp/features/image/presentation/controller/image_controller.dart';

// Floating action Button for the image input. Used on Home/History screen
class AddImageButtonWidget extends StatelessWidget {
  const AddImageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(234, 79, 108, 1),
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Color(0xFF22222E),
            title: Text(
              "Choose Source",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            content: Wrap(
              children: [
                Column(
                  children: [
                    MaterialButton(
                      color: Color(0xFF484c6d),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 28, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Camera",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => _pickImage(context, ImageSource.camera),
                    ),
                    SizedBox(height: 8),
                    MaterialButton(
                      color: Color(0xFF484c6d),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => _pickImage(context, ImageSource.gallery),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _pickImage(BuildContext context, ImageSource imageSource) async {
    final _imageController = Get.put(ImageController(ImageUseCase()));
    var picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
      source: imageSource,
    );

    if (pickedImage != null) {
      _imageController.addImage(pickedImage);
    }

    Navigator.pop(context);
  }
}
