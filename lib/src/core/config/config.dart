import '../services/unify_services.dart';

class UnifyApiConfig {
  /// [fcmBaseApi] is the base api for the FCM
  static Uri get fcmBaseApi {
    final config = UnifyServices.unifyConfig;
    if (config != null) {
      return Uri.parse(
          "https://fcm.googleapis.com/v1/projects/${config.projectName}/messages:send");
    } else {
      throw Exception(
          "Unify is not initialized, please initialize it first by calling: UnifyServices.initUnify(config)");
    }
  }
}
