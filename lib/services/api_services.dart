import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:offline_articles_app/models/data_models.dart';

class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<DataModel>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> dataList = jsonDecode(response.body);
        return dataList.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
