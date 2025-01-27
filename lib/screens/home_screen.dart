import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';

class HomeScreen extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Data Fetcher With Hive '),
        centerTitle: true,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (dataController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (dataController.dataList.isEmpty) {
              return Center(child: Text('No data available', style: TextStyle(fontSize: 18, color: Colors.grey)));
            }

            return ListView.builder(
              itemCount: dataController.dataList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepPurpleAccent,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      dataController.dataList[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('ID: ${dataController.dataList[index].id}', style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                    onTap: () {
                      // Add action on tap if needed
                    },
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
