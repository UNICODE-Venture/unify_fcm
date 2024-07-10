extension StatusCodeExt on int {
  /// Returns true if the status code is 200.
  bool get isOk => this == 200;
}
