import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      TextWidget(emailcontroller: emailcontroller),
                      SizedBox(
                        height: 20.h,
                      ),
                   
                      SizedBox(
                        height: 30.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              print(
                                  "done ${globalKey.currentState!.validate()}");
                            } else {
                              print("no done ${globalKey.currentState!.validate()}");
                            }
                          },
                          child: Text("Login"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.emailcontroller,
  });

  final TextEditingController emailcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill the data";
        } else {
          return null;
        }
      },
    );
  }
}
