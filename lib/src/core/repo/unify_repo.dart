import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:unify_fcm/src/extension/extension.dart';

import '../config/config.dart';
import '../models/unify_notification.dart';
import 'package:http/http.dart' as http;

import '../services/unify_services.dart';

class UnifyRepo {
  /// Send the notification to the user/subscribers of the channels
  static Future<String?> sendFCMNotification(
      UnifyNoficationModel notification) async {
    try {
      final result = await http.post(UnifyApiConfig.fcmBaseApi,
          body: notification.toFCMPayload(),
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${UnifyServices.unifyConfig?.fcmAccessToken}"
          });

      if (result.statusCode.isOk) {
        final idPayload =
            json.decode(result.body)["name"].toString().split("/");

        return idPayload.isEmpty ? result.body : idPayload.last;
      } else {
        debugPrint("Error occred while sending notification: ${result.body}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
