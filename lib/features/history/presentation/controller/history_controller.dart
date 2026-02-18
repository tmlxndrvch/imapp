import 'package:get/get.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';
import 'package:imapp/features/history/domain/usecases/history_usecase.dart';

class HistoryController extends GetxController {

  final HistoryUseCase _historyUseCase;

  HistoryController(this._historyUseCase);
  List imagesHistory = <ImageEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  void fetchHistory() async {
    imagesHistory.addAll(await _historyUseCase.fetchHistory());
  }

  void deleteHistoryItem(String id) async {
    await _historyUseCase.deleteHistoryItem(id);
    imagesHistory.removeWhere((item) => item.id == id);
  }

  void addHistoryItem(ImageEntity image) async {
    await _historyUseCase.addHistoryItem(image);
    imagesHistory.add(image);
  }

}