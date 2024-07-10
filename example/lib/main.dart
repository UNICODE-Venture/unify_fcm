import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unify_fcm/unify_fcm.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UnifyServices.initUnify(
    config: UnifyConfig(
      fcmAccessToken: "your_fcm_access_token_here",
      projectName: "your_firebase_project_name_here",
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Unify Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Welcome to Unify world ;)'),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text("Generate token"),
                onPressed: () async {
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

                  log(token ?? "");
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Send test notify"),
                onPressed: () async {
                  String? id = await UnifyServices.sendNotification(
                      notification: UnifyNoficationModel(
                    token: "your_user_fcm_token_here",
                    notifyId: "1",
                    title: "Hi Unify Fan :)",
                    body: "Let's go to the Unify world ^_^",
                    imageUrl:
                        "https://images.pexels.com/photos/9551192/pexels-photo-9551192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ));
                  debugPrint("Message id: $id");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
