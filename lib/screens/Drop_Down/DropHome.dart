import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DropHome extends StatefulWidget {
  const DropHome({super.key});

  @override
  State<DropHome> createState() => _DropHomeState();
}

class _DropHomeState extends State<DropHome> {
   List<String> _list=[
"General",
"Called",
"Visited",
"Private",
"Family"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
      
        ],
      ),
    );
  }
}