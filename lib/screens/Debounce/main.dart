import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  return runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: DebounceHome(),
    );
  }
}

class DebounceHome extends StatefulWidget {
  const DebounceHome({super.key});

  @override
  State<DebounceHome> createState() => _DebounceHomeState();
}

class _DebounceHomeState extends State<DebounceHome> {
  int _counter = 0;
  final debouncer = Debouncer(seconds: 5);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    var snackbar = const SnackBar(content: Text(" yey a snackbar"));
    debouncer.run(
      () {
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Debounce"),
        ),
        body: Column(
          children: [
         const   Text('You have pushed the button this many times'),
            Text('$_counter',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            )

          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:const Icon(Icons.add),
        ),
        );
  }
  
}

class Debouncer {
  final int seconds;
  Timer? _timer;
  Debouncer({required this.seconds});
  void run(Function() action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}
