import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    show() {
      toastification.showCustom(
        context: context,
        autoCloseDuration: const Duration(seconds: 5),
        alignment: Alignment.topRight,
        builder: (BuildContext context, ToastificationItem holder) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Custom Toast',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('This is a custom toast message!',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Perform an action when the button is pressed
                      },
                      child: const Text('Do Something'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("notify"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                show();
              },
              child: Text("show toast "))
        ],
      ),
    );
  }
}
