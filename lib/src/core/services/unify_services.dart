import '../models/unify_config.dart';
import '../models/unify_notification.dart';
import '../repo/unify_repo.dart';
import 'access_token_services.dart';

class UnifyServices {
  /// [unifyConfig] is the configuration class for the Unify package
  static UnifyConfig? unifyConfig;

  /// [initUnify] Initialize the Unify package with the configuration of [FCM](https://firebase.google.com/docs/cloud-messaging)
  static void initUnify({required UnifyConfig config}) {
    unifyConfig = config;
  }

  ///[genTokenFromServiceAcc] Generate the access bearer token from service account,
  ///
  /// get the service account json file from firebase and copy the content to the [serviceAccount] parameter. e.g:
  ///
  /// ```json
  ///   {
  ///     "type": "service_account",
  ///     "project_id": "",
  ///     "private_key_id": "",
  ///     "private_key": "",
  ///     "client_email": "",
  ///     "client_id": "",
  ///     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  ///     "token_uri": "https://oauth2.googleapis.com/token",
  ///     "auth_provider_x509_cert_url":
  ///         "https://www.googleapis.com/oauth2/v1/certs",
  ///     "client_x509_cert_url": "",
  ///     "universe_domain": "googleapis.com"
  ///   }
  /// ```
  static Future<String?> genTokenFromServiceAcc(
      {required Object serviceAccount}) async {
    return await AccessTokenServices.generateAccessToken(serviceAccount);
  }

  /// [sendNotification] Send the notification to the user/subscribers of the topics
  ///
  /// [notification] is the notification model which contains the notification data and the target user/subscribers token or topic name
  ///
  /// Also you can send your custom payload by using the [UnifyNoficationModel.data] parameter
  ///
  /// return the notification id if the notification is sent successfully

  static Future<String?> sendNotification(
      {required UnifyNoficationModel notification}) async {
    return await UnifyRepo.sendFCMNotification(notification);
  }
}
