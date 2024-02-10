import 'package:flutter/material.dart';
import 'package:hogi_milk/models/option.dart';
import 'package:hogi_milk/models/order.dart';
import 'package:hogi_milk/services/firebase_service.dart';

class DataManager with ChangeNotifier {
  Map<String, dynamic> _images = {};
  Map<String, dynamic> get images => _images;

  List<Option> _options = [];
  List<Option> get options => _options;

  final FirebaseService _firebaseService = FirebaseService();

  DataManager() {
    print('constructor is being called');
    _fetchData();
  }

  Future<void> _fetchData() async {
    print('Fetched the data');
    _images = await _firebaseService.getImages();
    _options = await _firebaseService.getOptions();
    notifyListeners();
  }

  Future<void> submitOrder(Order order) async {
    try {
      await _firebaseService.submitOrder(order);
      // Optionally, you can perform additional tasks after order submission
    } catch (e) {
      print('Error submitting order: $e');
      throw e; // Re-throw the exception for handling in the UI layer if needed
    }
  }
}
