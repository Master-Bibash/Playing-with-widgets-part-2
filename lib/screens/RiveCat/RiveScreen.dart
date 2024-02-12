import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveCatScreen extends StatelessWidget {

  StateMachineController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/0.1,

          child: RiveAnimation.asset("assets/cat.riv",
          
              fit: BoxFit.cover,
              stateMachines: ['state'], onInit: ((artboard) {
                controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
                if (controller == null) return;
                artboard.addController(controller!);
              }),),
        ),);
  }
}
