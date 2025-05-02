// ignore_for_file: file_names, prefer_final_fields

import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tngpc/constants/theme.dart';

class UserDataUploadMango extends GetxController {
  late Db _db;
  late DbCollection _collection;

  RxList<Map<String, dynamic>> issuesList = RxList<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    _connectToMongo();
    getIssueData();
  }

// connect to mangodb function
  Future<void> _connectToMongo() async {
    final url = dotenv.env['MONGO_URL'].toString();
    _db = await Db.create(url);

    await _db.open();
    _collection = _db.collection('user_data_upload');
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
        backgroundColor: tREd,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );
    }
  }

  //   create Empty list to store data
  RxList<Map<String, dynamic>> _allData = RxList<Map<String, dynamic>>([]);
  List<Map<String, dynamic>> get allData => _allData;
  //  create a finction to retrive data
  Future<void> getAlldata() async {
    try {
      final data = await _collection.find().toList();
      _allData.value = data;

      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to push data: $e',
        backgroundColor: tREd,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
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
        backgroundColor: tREd,
        snackPosition: SnackPosition.BOTTOM,
        colorText: tWhite,
      );
    }
  }

  Future<void> getIssueData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> fetchedIssues = [
      {'id': 1, 'issue': 'Issue 1', 'status': 'Received'},
      {'id': 2, 'issue': 'Issue 2', 'status': 'Processing'},
      {'id': 3, 'issue': 'Issue 3', 'status': 'Completed'},
    ];

    // issuesList.assignAll([
    //   {'id': 1, 'issue': 'Issue 1', 'status': 'Received'},
    //   {'id': 2, 'issue': 'Issue 2', 'status': 'Processing'},
    //   {'id': 3, 'issue': 'Issue 3', 'status': 'Completed'},
    // ]);

    // Apply saved statuses if they exist
    for (int i = 0; i < fetchedIssues.length; i++) {
      String savedStatus = prefs.getString('issue_status_$i') ??
          'Unknown'; // Default to 'Unknown'
      fetchedIssues[i]['status'] = savedStatus;
    }

    issuesList.assignAll(fetchedIssues);
  }

  // void updateIssueStatusByIndex(int index, double sliderValue) {
  //   if (index < issuesList.length) {
  //     issuesList[index]['status'] = sliderValueToStatus(sliderValue);
  //     issuesList.refresh(); // Notify listeners about the update
  //   }
  // }

  Future<void> updateIssueStatusByIndex(int index, double sliderValue) async {
    if (index < issuesList.length) {
      String status = sliderValueToStatus(sliderValue);
      issuesList[index]['status'] = status;

      // Persist the status in SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'issue_status_$index', status); // Use a unique key for each issue

      issuesList.refresh(); // Notify listeners about the update
    }
  }

  String getStatusByIndex(int index) {
    if (index < issuesList.length) {
      return issuesList[index]['status'] ?? 'Unknown';
    }
    return 'Unknown';
  }

  double getSliderValueByIndex(int index) {
    String status = getStatusByIndex(index);
    return statusToSliderValue(status);
  }

  double statusToSliderValue(String status) {
    switch (status) {
      case 'Received':
        return 0.0;
      case 'Processing':
        return 1.0;
      case 'Completed':
        return 2.0;
      default:
        return 0.0; // Default or fallback value
    }
  }

  String sliderValueToStatus(double value) {
    switch (value.round()) {
      case 0:
        return 'Received';
      case 1:
        return 'Processing';
      case 2:
        return 'Completed';
      default:
        return 'Unknown';
    }
  }

  @override
  void onClose() {
    _db.close();

    super.onClose();
  }
}
