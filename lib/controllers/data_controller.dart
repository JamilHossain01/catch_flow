import 'package:get/get.dart';
import 'package:offline_articles_app/models/data_models.dart';
import 'package:offline_articles_app/services/api_services.dart';
import 'package:offline_articles_app/storage/hive_services.dart';


class DataController extends GetxController {
  var dataList = <DataModel>[].obs;
  var isLoading = false.obs;
  final ApiService apiService = ApiService();
  final HiveService hiveService = HiveService();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    // Check if data exists in Hive cache first
    var cachedData = await hiveService.getCachedData();
    if (cachedData != null) {
      dataList.value = cachedData;
    }

    // Fetch new data from API
    var apiData = await apiService.fetchData();
    if (apiData != null) {
      dataList.value = apiData;
      hiveService.cacheData(apiData);  // Cache the data locally
    }

    isLoading.value = false;
  }
}
