import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnectivity extends StatefulWidget {
  const CheckInternetConnectivity({super.key});

  @override
  State<CheckInternetConnectivity> createState() =>
      _CheckInternetConnectivityState();
}

class _CheckInternetConnectivityState extends State<CheckInternetConnectivity> {
  late StreamSubscription subscription;

  String statusText = "Check your Connection now ";
  Color statusColor = Colors.black;

  void CheckConnectivity(ConnectivityResult result) {
    setState(() {
      statusText = "Checking .....";
    });
    switch (result) {
      case ConnectivityResult.mobile:
        setState(() {
          statusText = "Connectected to mobile network";
          statusColor = Colors.blue;
        });
        break;
      case ConnectivityResult.wifi:
        setState(() {
          statusText = 'Connected to wifi network';
          statusColor = Colors.green;
        });

        break;
      default:
        setState(() {
          statusText = "Not Connected";
          statusColor = Colors.red;
        });
    }
  }

  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  // final Connectivity _connectivity=Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubsription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("this is a test"),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            "Active connection types",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
                 final connectivityResult =await Connectivity().checkConnectivity();
                    if (connectivityResult == ConnectivityResult.none) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    'You\'re not connected to a network')
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You\'re connected to a ${connectivityResult.first.name} network')
                ));
            }

            },
           
            child: Text("check"),
          )
        ],
      ),
    );
  }
}
