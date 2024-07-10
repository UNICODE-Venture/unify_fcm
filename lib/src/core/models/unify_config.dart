class UnifyConfig {
  /// [fcmAccessToken] is the Firebase Cloud Messaging bearer access token. e.g: `ya29.ElqKBGN2Ri_Uz...HnS_uNreA`
  final String fcmAccessToken;

  /// [projectName] is the name of your firbase project.
  final String projectName;

  /// [UnifyConfig] is the configuration class for the Unify package
  UnifyConfig({
    required this.fcmAccessToken,
    required this.projectName,
  })  : assert(fcmAccessToken.isNotEmpty, "FCM Access Token can't be empty"),
        assert(projectName.isNotEmpty, "Project Name can't be empty");
}
