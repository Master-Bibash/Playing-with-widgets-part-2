// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


// class CheckInternetScreen extends StatefulWidget {
//   const CheckInternetScreen({super.key});

//   @override
//   State<CheckInternetScreen> createState() => _CheckInternetScreenState();
// }

// class _CheckInternetScreenState extends State<CheckInternetScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     checkcon();
//     super.initState();
//   }

//   dynamic checkcon() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (_) => const NetworkErrorDialog(),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//               'You\'re not connected to any network')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           ElevatedButton(
//             child: const Text("Check Connection"),
//             onPressed: () async {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NetworkErrorDialog extends StatelessWidget {
//   const NetworkErrorDialog({Key? key, this.onPressed}) : super(key: key);
//   final Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       content: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//               width: 200,
//               child: Image.asset('assets/images/no_connection.png')),
//           const SizedBox(height: 32),
//           const Text(
//             "Whoops!",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "No internet connection found.",
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             "Check your connection and try again.",
//             style: TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             child: const Text("Try Again"),
//             onPressed: onPressed,
//           )
//         ],
//       ),
//     );
//   }
// }
