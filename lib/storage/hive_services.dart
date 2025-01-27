import 'package:hive/hive.dart';
import 'dart:convert';

import '../models/data_models.dart';

class HiveService {
  Future<void> cacheData(List<DataModel> data) async {
    var box = await Hive.openBox('myBox');
    await box.put('data', jsonEncode(data.map((e) => e.toJson()).toList()));
  }

  Future<List<DataModel>?> getCachedData() async {
    var box = await Hive.openBox('myBox');
    var cachedData = box.get('data');
    if (cachedData != null) {
      List<dynamic> dataList = jsonDecode(cachedData);
      return dataList.map((e) => DataModel.fromJson(e)).toList();
    }
    return null;
  }
}
