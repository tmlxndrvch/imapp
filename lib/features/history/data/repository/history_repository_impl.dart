import 'package:imapp/features/history/data/data_sources/local/history_local_datasource.dart';
import 'package:imapp/features/history/data/models/image_data.dart';
import 'package:imapp/features/history/domain/repository/history_repository.dart';
import 'package:imapp/core/constants/boxes.dart';

class HistoryRepositoryImpl implements HistoryRepository{

  final HistoryLocalDataSource _historyLocalDataSource;

  HistoryRepositoryImpl(this._historyLocalDataSource);

  @override
  Future<dynamic> getHistory() async {
    try {
      var result = await _historyLocalDataSource.getHistory();
      return result;
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Future<dynamic> addHistoryItem(ImageData imageData) async {
    try {
      await imageBox.put(imageData.id.toString(), imageData);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Future<dynamic> deleteHistoryItem(String id) async {
    try {
      await _historyLocalDataSource.deleteItem(id);
    } catch (error) {
      print(error.toString());
    }
  }


}