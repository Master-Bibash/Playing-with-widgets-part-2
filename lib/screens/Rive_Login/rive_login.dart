import 'package:flutter/material.dart';

class RiveLogin extends StatefulWidget {
  const RiveLogin({super.key});

  @override
  State<RiveLogin> createState() => _RiveLoginState();
}

class _RiveLoginState extends State<RiveLogin> {
  String validEmail = "bibash@gmail.com";
  String validPassword = '1234';

  //input for controller
  FocusNode emailFocousNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  //rive controller and input
  StateMachineController? controller;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    // TODO: implement initState
    emailFocousNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  void emailFocus() {
    isChecking?.change(emailFocousNode.hasFocus);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailFocousNode.removeListener(emailFocus);
    emailController.removeListener(passwordFocus);

    super.dispose();
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6E2EA),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              height: 64,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                    'https://raw.githubusercontent.com/dannndi/flutter_interactive_login_form_with_rive/main/assets/rive_logo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Rive example of Animated Bear ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: RiveAnimation.asset(
                "assets/loginted.riv",
                fit: BoxFit.cover,
                stateMachines: ["Login Machine"],
                onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                      artboard, "Login Machine");
                  if (controller == null) return;
                  artboard.addController(controller!);
                  isChecking = controller?.findInput("isChecking");
                  numLook = controller?.findInput("numLook");
                  isHandsUp = controller?.findInput("isHandsUp");
                  trigSuccess = controller?.findInput("trigSuccess");
                  trigFail = controller?.findInput("trigFail");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: TextField(
                      focusNode: emailFocousNode,
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        numLook?.change(value.length.toDouble());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      decoration:const  InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {},
                    ),
                  ),
               const   SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),
                        onPressed: () async {
                          emailFocousNode.unfocus();
                          passwordFocusNode.unfocus();
                          final email = emailController.text;
                          final password = passwordController.text;
                          CircularProgressIndicator();
                          await Future.delayed(
                            Duration(seconds: 100),
                          );
                          if (mounted) Navigator.pop(context);
                          if (email == validEmail &&
                              password == validPassword) {
                            trigSuccess?.change(true);
                          } else {
                            trigFail?.change(true);
                          }
                        },
                        child: Text("Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Poppins"

                        ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
