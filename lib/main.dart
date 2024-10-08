import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_integration_demo/controllers/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final DataController controller = Get.put(DataController()); // Inject controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Integration Demo')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.dataList.isEmpty) {
          return const Center(child: Text('No Data Available'));
        } else {
          return ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Post ID: ${controller.dataList[index]['id']}'),
                subtitle: Text(controller.dataList[index]['title']),
              );
            },
          );
        }
      }),
    );
  }
}
