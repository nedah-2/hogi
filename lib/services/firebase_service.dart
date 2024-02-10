import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:hogi_milk/models/option.dart';
import 'package:hogi_milk/models/order.dart';
import 'package:hogi_milk/services/notification_service.dart';

class FirebaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final NotificationServices _notificationService = NotificationServices();

  Future<Map<String, dynamic>> getImages() async {
    return {'img1': 'url1', 'img2': 'url2'};
    // try {
    //   final snapshot = await _database.ref('images').get();
    //   final data = snapshot.value as Map<String, dynamic>;
    //   print(data);
    //   return data;
    // } catch (e) {
    //   debugPrint('Error fetching images: $e');
    //   return {};
    // }
  }

  Future<List<Option>> getOptions() async {
    try {
      List<Option> options = [
        Option(count: 2, price: 80000),
        Option(count: 3, price: 72000),
        Option(count: 4, price: 64000),
      ];
      // final snapshot = await _database.ref('options').get();
      // final data = snapshot.value as List<dynamic>;
      // for (var value in data) {
      //   print(value);
      //   options.add(Option.fromJson(value));
      // }
      return options;
    } catch (e) {
      debugPrint('Error fetching options: $e');
      return [];
    }
  }

  Future<void> submitOrder(Order order) async {
    try {
      await _database.ref('orders').push().set(order.toJson());

      // Send notification to the admin app upon successful submission
      await _notificationService.sendPushMessage();
    } catch (e) {
      debugPrint('Error submitting order: $e');
    }
  }
}
