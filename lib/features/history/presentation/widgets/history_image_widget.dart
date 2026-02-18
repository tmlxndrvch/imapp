import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';

import '../../../image/domain/image_usecase.dart';
import '../../../image/presentation/controller/image_controller.dart';

class HistoryImageWidget extends StatelessWidget {
  final ImageEntity _image;

  const HistoryImageWidget(this._image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 72, 76, 109),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color.fromRGBO(234, 79, 108, 1),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _image.type,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                _image.createdDate,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Delete this image?"),
                    actions: [
                      MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          final _imageController = Get.put(
                            ImageController(ImageUseCase()),
                          );
                          _imageController.deleteImage(_image);
                          Navigator.pop(context);
                        },
                        child: Text("Confirm"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete_forever, color: Colors.red, size: 32),
          ),
        ],
      ),
    );
  }
}
