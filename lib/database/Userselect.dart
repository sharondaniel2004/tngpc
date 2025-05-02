// ignore_for_file: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tngpc/constants/theme.dart';

class UserDataselect extends GetxController {
  late Db _db;
  late DbCollection _collection;

  @override
  void onInit() {
    super.onInit();
    _connectToMongo();
  }

// connect to mangodb function
  Future<void> _connectToMongo() async {
    final url = dotenv.env['MONGO_URL'].toString();
    _db = await Db.create(url);

    await _db.open();
    _collection = _db.collection('user_data_select');
  }

  // push data function
  Future<void> pushData(Map<String, dynamic> data) async {
    try {
      await _collection.insert(data);
      Get.snackbar(
        'Sucess',
        'Data pushed to mongoDB sucessfully',
        backgroundColor: tGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to push data: $e',
        backgroundColor: tGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );
    }
  }

  //   create Empty list to store data
  final RxList<Map<String, dynamic>> _allData =
      RxList<Map<String, dynamic>>([]);
  List<Map<String, dynamic>> get allData => _allData;

  //  create a function to retrive data
  Future<void> getAlldata() async {
    try {
      final data = await _collection.find().toList();
      _allData.value = data;

      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to push data: $e',
        backgroundColor: tGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tREd,
      );
    }
  }

  //  create a function to del the data
  Future<void> deleteData(String uuid) async {
    try {
      await _collection.deleteOne({"_id": uuid});

      Get.snackbar(
        'Sucess',
        'Data deleted sucessfully',
        backgroundColor: tGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );

      await getAlldata();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete data: $e',
        backgroundColor: tGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );
    }
  }

  @override
  void onClose() {
    _db.close();

    super.onClose();
  }
}
