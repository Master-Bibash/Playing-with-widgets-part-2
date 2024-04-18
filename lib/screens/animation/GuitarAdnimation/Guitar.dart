import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  final double maxSide = 255.0;
  AnimationController? animationController;
  // AnimatedController controller = AnimatedController();
  // animationController.addListener((status) {
  //   re

  //  })
  bool? _canbeDragged;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  void _onDragStart(DragStartDetails details) {
    print(
        "details sart details is ${details} and controller value is ${animationController!.isDismissed}");
    // bool isDragOpenFromLeft = animationController!.isDismissed &&
    //     details.globalPosition.dx < minDragStartEdge;
    //     bool isDragCloseFromRight=animationController
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canbeDragged!) {
      double delta = details.primaryDelta! / maxSide;
      animationController!.value += delta;
    }
  }

  void toggle() => animationController!.isDismissed
      ? animationController!.forward()
      : animationController!.reverse();

  @override
  Widget build(BuildContext context) {
    Container myDrawer = Container(
      color: Colors.blue,
    );

    Container myChild = Container(
      color: Colors.yellow,
    );

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onVerticalDragUpdate: (details) {
        print("update is $details");
      },
      onVerticalDragEnd: (details) {
        print(" end  is $details");
      },
      onTap: toggle,
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (context, _) {
          double slide = maxSide * animationController!.value;
          double scale = 1 - (animationController!.value * 0.3);
          return Stack(
            children: [
              myDrawer,
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: myChild),
            ],
          );
        },
      ),
    );
  }
}
