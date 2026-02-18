import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';
import 'package:imapp/features/history/presentation/controller/history_controller.dart';
import 'package:imapp/features/image/domain/image_usecase.dart';

//
class ImageController extends GetxController {

  final ImageUseCase _imageUseCase;
  final _historyController = Get.find<HistoryController>();
  var imagePath = "".obs;
  var imageType = "".obs;

  ImageController(this._imageUseCase);

  Future<void> addImage(XFile pickedImage) async {
    ImageEntity image = await _imageUseCase.processImage(pickedImage);
    _historyController.addHistoryItem(image);
  }

  // Select an image from the Home/History screen to view it
  Future<void> selectImage(String type, String path) async {
    imagePath.value = path;
    imageType.value = type;
  }

  Future<void> deleteImage(ImageEntity image) async {
    await _imageUseCase.deleteImage(image.filePath);
    _historyController.deleteHistoryItem(image.id);
  }

}