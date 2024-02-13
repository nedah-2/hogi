import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:hogi_milk/models/option.dart';
import 'package:hogi_milk/models/order.dart';
import 'package:hogi_milk/services/notification_service.dart';

class FirebaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final NotificationServices _notificationService = NotificationServices();

  Future<Map> getImages() async {
    try {
      final snapshot = await _database.ref('images').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map;
        return data;
      } else {
        // Handle case when 'images' node does not exist or is empty
        return {};
      }
    } catch (e) {
      debugPrint('Error fetching images: $e');
      return {};
    }
  }

  Future<List<Option>> getOptions() async {
    try {
      List<Option> options = [];
      final snapshot = await _database.ref('options').get();
      if (snapshot.exists) {
        final data = snapshot.value as List;
        for (var value in data) {
          if (value != null) {
            options.add(Option.fromJson(value));
          }
        }
      }
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
