import 'dart:convert';

class UnifyNoficationModel {
  /// [notifyId] is the unique id of the notification
  late String notifyId;

  /// [title] is the title of the notification
  late String title;

  /// [body] is the body of the notification
  late String body;

  /// [imageUrl] is the image url of the notification will be shown in the notification activity natively
  late String? imageUrl;

  /// [token] is the token of the user where notification will be sent
  late String? token;

  /// [topic] is the topic name of channels where notification will be sent
  late String? topic;

  /// [data] is the data of the notification, in key-value pair e.g: `{"productId": "xyz12345"}`
  late Map<String, dynamic> data;

  /// [UnifyNoficationModel] is the model class for the notification
  UnifyNoficationModel({
    required this.notifyId,
    required this.title,
    required this.body,
    this.imageUrl,
    this.data = const {},
    this.token,
    this.topic,
  })  : assert(title.isNotEmpty, "Title can't be empty"),
        assert(body.isNotEmpty, "Body can't be empty"),
        assert(token != null || topic != null,
            "Token or Topic any one is required to send the notification"),
        assert(token == null || topic == null,
            "Token and Topic both can't be provided at the same time");

  /// [UnifyNoficationModel.fromJson] is a factory method to create a [UnifyNoficationModel] from a map
  factory UnifyNoficationModel.fromJson(Map<String, dynamic> map) {
    return UnifyNoficationModel(
      notifyId: map['notifyId'],
      title: map['title'],
      body: map['body'],
      data: map['data'],
    );
  }

  /// [toJson] is a method to convert a [UnifyNoficationModel] to a map
  Map<String, dynamic> toJson() => {
        'notifyId': notifyId,
        'title': title,
        'body': body,
        'data': data,
      };

  /// [toFCMPayload] is a method to convert a [UnifyNoficationModel] to a payload for the notification of [FCM](https://firebase.google.com/docs/cloud-messaging)
  String toFCMPayload() => json.encode({
        "message": {
          // For individual user
          if (token != null) 'token': token,
          // For topic channel
          if (topic != null) 'topic': topic,
          'notification': {
            'title': title,
            'body': body,
            'image': imageUrl,
          },
          'data': data,
        }
      });
}
