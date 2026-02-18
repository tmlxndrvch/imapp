import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imapp/features/history/data/data_sources/local/history_local_datasource.dart';
import 'package:imapp/features/history/data/repository/history_repository_impl.dart';
import 'package:imapp/features/history/domain/usecases/history_usecase.dart';
import 'package:imapp/features/history/presentation/controller/history_controller.dart';
import 'package:imapp/features/image/presentation/views/image_preview_view.dart';
import 'package:imapp/features/image/presentation/widgets/add_image_button_widget.dart';
import 'package:imapp/features/history/presentation/widgets/history_image_widget.dart';

import '../../../image/domain/image_usecase.dart';
import '../../../image/presentation/controller/image_controller.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {

  final _historyController = Get.put(
    HistoryController(
      HistoryUseCase(HistoryRepositoryImpl(HistoryLocalDataSourceImpl())),
    ),
  );

  final _imageController = Get.put(ImageController(ImageUseCase()));


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1a1a24),
        floatingActionButton: AddImageButtonWidget(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Image Flow",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: GetX<HistoryController>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.imagesHistory.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _imageController.selectImage(controller.imagesHistory[index].type, controller.imagesHistory[index].filePath);

                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const ImagePreviewView(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: HistoryImageWidget(
                              controller.imagesHistory[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
