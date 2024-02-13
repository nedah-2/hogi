import 'package:flutter/material.dart';
import 'package:hogi_milk/models/option.dart';
import 'package:hogi_milk/models/order.dart';
import 'package:hogi_milk/services/firebase_service.dart';

class DataManager with ChangeNotifier {
  Map _images = {};
  Map get images => _images;

  List<Option> _options = [];
  List<Option> get options => _options;

  final FirebaseService _firebaseService = FirebaseService();

  DataManager() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    _images = await _firebaseService.getImages();
    _options = await _firebaseService.getOptions();
    notifyListeners();
  }

  Future<void> submitOrder(Order order) async {
    try {
      await _firebaseService.submitOrder(order);
      // Optionally, you can perform additional tasks after order submission
    } catch (e) {
      debugPrint('Error submitting order: $e');
    }
  }
}
