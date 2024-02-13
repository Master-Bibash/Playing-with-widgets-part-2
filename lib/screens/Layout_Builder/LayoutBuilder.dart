import 'package:flutter/material.dart';

class layoutBuidlerScreen extends StatefulWidget {
  const layoutBuidlerScreen({super.key});

  @override
  State<layoutBuidlerScreen> createState() => _layoutBuidlerScreenState();
}

class _layoutBuidlerScreenState extends State<layoutBuidlerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 100,
              width: double.infinity,
              color: Colors.red,
            ),
            LayoutBuilder(

              builder: (context, constraints) {
                if (constraints.maxWidth>500) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.blue,
                  );
                  
                }
                return Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
