import 'package:get/get.dart';
import '../repository/respository.dart';

class DataController extends GetxController {
  final Repository _repository = Repository();

  var dataList = [].obs; // Observable list for UI
  var isLoading = true.obs; // Observable loading status

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      var data = await _repository.fetchData();
      dataList.value = data; // Update the observable list
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false); // Stop the loading state
    }
  }
}
