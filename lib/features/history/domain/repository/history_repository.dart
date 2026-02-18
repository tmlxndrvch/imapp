import 'package:imapp/features/history/domain/entities/image_entity.dart';

import '../../data/models/image_data.dart';

abstract class HistoryRepository {
  Future getHistory();
  Future addHistoryItem(ImageData imageData);
  Future deleteHistoryItem(String id);
}