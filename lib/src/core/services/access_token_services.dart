import 'package:googleapis_auth/auth_io.dart';

class AccessTokenServices {
  /// [tokenScopes] is the scope of the token
  static String tokenScopes =
      "https://www.googleapis.com/auth/firebase.messaging";

  /// [generateAccessToken] is a method to generate the access token from the service account keys for the firebase cloud messaging
  static Future<String?> generateAccessToken(Object keys) async {
    try {
      final client = await clientViaServiceAccount(
          ServiceAccountCredentials.fromJson(keys), [tokenScopes]);

      String token = client.credentials.accessToken.data;
      return token;
    } catch (e) {
      return null;
    }
  }
}
