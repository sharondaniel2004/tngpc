// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get/get.dart';
// import 'package:mongo_dart/mongo_dart.dart';

// class mongodb extends GetxController {
//   late Db db;
//   late DbCollection dbCollection;
//   @override
//   void onInit() {
//     super.onInit();
//     connecttomongo();
//   }

//   Future<void> connecttomongo() async {
//     final url = dotenv.env['MONGO_URL'].toString();
//     db = await Db.create(url);

//     await db.open();
//     dbCollection = db.collection('user_data_upload');
//   }
// }
