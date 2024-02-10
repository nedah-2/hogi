import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<String> getAccessToken() async {
  // Load the service account credentials from a JSON file
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "hogi-c01d9",
    "private_key_id": "974ba73ba7bdee97dd720b7d4d7ee212734bb82d",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC4VL/sgzCe83FE\nq7RAUzStEDgJG7ozr8s1K3/7JENdXRzN584h9pBADqYgwFNU076AINz1ajPl1blB\nd42YRliESg3f81O52ta7Ycjc3ifgkTEq3ru6OVsVXtpRP1W72IMCas4AuHoRJADN\neHwMWVV/gDvUx18o0n6BMCCyLPxh+ePa6M9kUoFHL9nT3ZswFnc/KFxM7htHqtc5\n0o+Ldj0/Yvi4z89FH31xOAE5zxjFTFg+SmeRD/4HuktrYaqFRCnDN1cnI6zknm6/\nAymgAeR/NMVXVHn5jH3KFKfVs61AK2LsOnNAXGXMsqxyljavYf+xqKSPhWD0Null\nV/KSYUrxAgMBAAECggEAB4POVpubRK0DGKbGu0/zwqckdFvw3EDrUBhyaBrjM4Vj\ncmeOvqa5MctcbX25x/22ngL4+c5hyER4KtmaEwkHJyQyavIWHz/IkldwY29xK8Aa\nQ4z/ap5XqXLhA//zhFbVhyiIi9H5iVpbkq+PSxzslef0ndOfpwqR2r12D8gyuoxu\nSOQD4Z/OVX8RL3s2kZoPyN8kM0J+DCs+L+I1IKLmf6Vx6cLv+n5UUMHvaAYRHTDI\nNy5Ym2AOFFo4RZvdwsj2aaHIWCmDVV8Hf/EheVz6Ga8LyCoZkkJN0+UkQSZ0o6g8\nBE1waO9RJUKAiTiE9FQBxuAJkMnB2uHn97loT7QoQwKBgQDji4HZLjTHpfpX5wIm\nrByMPGBjIr+Ou9XHddANJbT2VMggZCvEpEtpej/sXl/V9HRBD/MpZE6cyE4Poqn9\nGrig8sfnydYDClteqYXe9TF1NbXgfJSsTDkWHvl1lMZRx7OOTMKESHSlxPUG7lAc\nRfjPhx/LqxUe13R6yY7Dw2z2owKBgQDPYdFWaV/z63VqC/2bsHxIyZ52e8Po/dr/\n+eIv2jb0wErRgg4d8QLzE3tU2WCOZ5YFAwLFWQGQWXCMmpoA3zm86YUbd+O5pB/A\nasSFj8ybCvqPyHnaMcDRD6JocMxafFQnrKnEvgcS3tBdqqBPw1YcbHj+4iwCPRqQ\nToYHj9DVWwKBgQC/XdulmHuhENEbTlf7yDH2KuzxUw8Bbq2bI1UHSZgIt0LcIwLA\nTWBy4/KQysoUuZNwCIb7X7XRm5AzDB2klO2DxssjABdx1SsE0NOasGGY7sP4eS3c\nPfqgxQoNvkKQEsDKw3mwIPOhWqSr4I8VSC+58S1nb4nCt3bpsUvVDi08uwKBgEiA\nai9Lp8AfEW2Bw6gqi0jnM/84RcWu+mGDexA/ufbXQ1D7pvPQzrcsmHGRjbA7hrc5\n1j4oX+OXYUHGyxCC+iyRd3ei8np0ZqVerlYDcATEUdTywacGveJZFO5ugQMhdEpq\nku+1f8OZIj+c5277W5+UTLjPWZNuyVqqGTGLlfcBAoGBAOFP9RxxdKK3ojl4UVBm\n0uL1/hW+/AWSQLEv9xDZ0EJFfvGEAu9gAeC8HC8PUC+IGDTVkyFHmXkgrtGk3Yc3\nW5RANkjSmUVO5A0kNfXMzOD83oDRr72LJZ4xOPp9qYKzWc4vV166+Sb2z9/P+Kib\nRuXvzPaa1EPykRctHp7ZNYHC\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-sa5dx@hogi-c01d9.iam.gserviceaccount.com",
    "client_id": "111340464461368409251",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-sa5dx%40hogi-c01d9.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  });

  // Create an authenticated HTTP client using the service account credentials
  final client = await clientViaServiceAccount(
    serviceAccountCredentials,
    [
      'https://www.googleapis.com/auth/cloud-platform',
      'https://www.googleapis.com/auth/firebase.messaging'
    ],
  );

  try {
    // Obtain the access credentials
    final accessCredentials = client.credentials;

    // Return the access token
    return accessCredentials.accessToken.data;
  } finally {
    // Close the HTTP client to release resources
    client.close();
  }
}

class NotificationServices {
  /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
  String _constructFCMPayload() {
    return jsonEncode({
      "message": {
        "topic": "news",
        "notification": {
          "title": "Order Received",
          "body": "A new order has been placed. Tap to manage."
        },
      }
    });
  }

  Future<void> sendPushMessage() async {
    try {
      final serverKey = await getAccessToken();
      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/hogi-c01d9/messages:send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $serverKey'
        },
        body: _constructFCMPayload(),
      );
      // Check the status code of the response
      if (response.statusCode == 200) {
        debugPrint('FCM request for device sent!');
      } else {
        debugPrint(
            'Failed to send FCM request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('------ $e ------');
    }
  }
}
