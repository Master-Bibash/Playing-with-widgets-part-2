import 'package:flutter/material.dart';


// void main() =>  runApp(MaterialApp(home:  ScreenFirstFade()));





class ScreenFirstFade extends StatefulWidget {
  const ScreenFirstFade({super.key});

  @override
  State<ScreenFirstFade> createState() => _ScreenFirstFadeState();
}

class _ScreenFirstFadeState extends State<ScreenFirstFade>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: false);
  late final Animation<double> _animatoin =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

      @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(opacity: _animatoin,
      child: Padding(padding: EdgeInsets.all(8),
      child:FlutterLogo()

      ),
      ),
    );
  }
}
