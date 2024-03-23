import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

// ignore: must_be_immutable
class RiveCatScreen extends StatelessWidget {

  StateMachineController? controller;

  RiveCatScreen({super.key});

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
        ),
        );
  }
}
