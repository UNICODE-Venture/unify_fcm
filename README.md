#### Unify library Crafted by the **[UNICODE Team](https://www.unicodesolutions.co/).**

A Light-weight Flutter package to send remote push notifications using Firebase Cloud Messaging (FCM) v1 API and generate access token from service account.🇸🇦💙🇧🇩❤️🇪🇬

# **Features support**

- **Access Token:** You can create bearer access token using your project service account json file.
- **Text Notification:** Sending reguler text notification with title, and body 📲.
- **Image Notification:** You can send image too, if your app support image notification 😉
- **Topic Notification:** Send notification to all subscribers of topic 📬.

<img src="https://raw.githubusercontent.com/UNICODE-Venture/unify_fcm/main/assets/screenshots/1.jpg" alt="unify_fcm by Saif" width="200" height="400">

## Getting started

Please have a look at our [/example](https://pub.dev/packages/uni_country_city_picker/example) project for a better understanding of implementations.

#### Initialize it in the `main.dart` file to send the notification.

```dart
 UnifyServices.initUnify(
    config: UnifyConfig(
      fcmAccessToken: "your_fcm_access_token_here",
      projectName: "your_firebase_project_name_here",
    ),
  );
```

#### Generate the bearer access token.

```dart
  String? token = await UnifyServices.genTokenFromServiceAcc(
                  serviceAccount: {
                    "type": "service_account",
                    "project_id": "",
                    "private_key_id": "",
                    "private_key": "",
                    "client_email": "",
                    "client_id": "",
                    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
                    "token_uri": "https://oauth2.googleapis.com/token",
                    "auth_provider_x509_cert_url":
                        "https://www.googleapis.com/oauth2/v1/certs",
                    "client_x509_cert_url": "",
                    "universe_domain": "googleapis.com"
                  },
                );
```

#### Send notification to user using fcm token.

```dart
 String? id = await UnifyServices.sendNotification(
                      notification: UnifyNoficationModel(
                    token: "your_user_fcm_token_here",
                    notifyId: "1",
                    title: "Hi Unify Fan :)",
                    body: "Let's go to the Unify world ^_^",
                    imageUrl:
                        "https://images.pexels.com/photos/9551192/pexels-photo-9551192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ));
```

#### Send notification to topics channel.

```dart
 String? id = await UnifyServices.sendNotification(
                      notification: UnifyNoficationModel(
                    topic: "your_topic_name_here",
                    notifyId: "1",
                    title: "Hi Unify Fans :)",
                    body: "Let's go to the Unify world ^_^",
                    imageUrl:
                        "https://images.pexels.com/photos/9551192/pexels-photo-9551192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ));
```

#### If you enjoyed it, then give it a star ⭐️ and like 👍🏻 and for more arts & crafts 🎨 from our team kindly visit here [Team UNICODE](https://pub.dev/publishers/unicodesolutions.co/packages). Until next time, keep coding and stay awesome 😉
