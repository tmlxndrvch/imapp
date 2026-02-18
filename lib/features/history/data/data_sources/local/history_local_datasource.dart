import 'package:get/get.dart';
import 'package:imapp/features/history/domain/entities/image_entity.dart';
import 'package:imapp/features/history/domain/repository/history_repository.dart';
import 'package:imapp/core/constants/boxes.dart';

abstract class HistoryLocalDataSource {
  Future getHistory();
  Future deleteItem(String id);
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {

  @override
  getHistory() async{
    return imageBox.values;
  }

  @override
  Future deleteItem(String id) async {
    await imageBox.delete(id);
  }






}