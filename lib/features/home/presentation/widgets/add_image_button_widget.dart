import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            title: Text("Choose Source", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),),
            content: Wrap(
              children: [
                Column(
                  children: [
                    MaterialButton(
                        color: Color(0xFF484c6d),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 28, color: Colors.white,),
                            SizedBox(width: 8,),
                            Text("Camera", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                        onPressed: () async {
                          var picker = ImagePicker();
                          var pickedImage = await picker.pickImage(source: ImageSource.camera);
                          File? image;

                          if (pickedImage != null) {
                            image = File(pickedImage.path);
                          }

                          Navigator.pop(context);

                        }),
                    SizedBox(height: 8,),
                    MaterialButton(
                        color: Color(0xFF484c6d),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_outlined, size: 28, color: Colors.white,),
                            SizedBox(width: 8,),
                            Text("Gallery", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                        onPressed: () async {
                          var picker = ImagePicker();
                          var pickedImage = await picker.pickImage(source: ImageSource.gallery);
                          File? image;

                          if (pickedImage != null) {
                            image = File(pickedImage.path);
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
