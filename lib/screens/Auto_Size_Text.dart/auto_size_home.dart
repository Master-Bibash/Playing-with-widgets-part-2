import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AutoScreenTextAdjust extends StatefulWidget {
  const AutoScreenTextAdjust({super.key});

  @override
  State<AutoScreenTextAdjust> createState() => _AutoScreenTextAdjustState();
}

class _AutoScreenTextAdjustState extends State<AutoScreenTextAdjust> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.all(20),
            
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(

              ),),
            child: Text("In the previous article, we have learned how to parse JSON into type-safe model classes in Dart.But writing all the JSON parsing code by hand ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 3,
            
             
              overflow: TextOverflow.ellipsis,
            ),),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                border: Border.all() 

              ),

              child: AutoSizeText("In the previous article, we have learned how to parse JSON into type-safe model classes in Dart.But writing all the JSON parsing code by hand ",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              maxLines: 3,
              minFontSize: 20,
              overflow: TextOverflow.ellipsis,
              ),
            )
            


        ],
      ),
    );
  }
}