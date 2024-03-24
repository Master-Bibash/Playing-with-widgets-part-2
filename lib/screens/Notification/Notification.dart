import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Custom Toast Demo"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Fluttertoast.showToast(msg: "this is a message");
                  toastification.show(
                      context: context,
                      title: Text("data"),
                      showProgressBar: true,
                      // alignment: Alignment.lerp(a, b, t)

                      // direction: TextDirection.rtl
                      );
                },
                child: Text("Show Toast"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
