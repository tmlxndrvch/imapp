import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:imapp/features/history/data/models/image_data.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';
import 'package:imapp/features/history/domain/repository/history_repository.dart';

// There is no error handling or other edge cases. For now only the success scenario
class HistoryUseCase {
  final HistoryRepository _historyRepository;
  HistoryUseCase(this._historyRepository);


  Future<dynamic> addHistoryItem(ImageEntity image) async {
    ImageData imageData = ImageData(id: image.id, type: image.type, filePath: image.filePath, date: image.createdDate);
    await _historyRepository.addHistoryItem(imageData);
  }

  Future<dynamic> deleteHistoryItem(String id) async {
    await _historyRepository.deleteHistoryItem(id);
  }

  Future<dynamic> fetchHistory() async {
    var result = await _historyRepository.getHistory();
    List<ImageEntity> images = [];
    for (var image in result) {
      images.add(ImageEntity(image.id, image.type, image.filePath, image.date));
    }

    return images;
  }

}