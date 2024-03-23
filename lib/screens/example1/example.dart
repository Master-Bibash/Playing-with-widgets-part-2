import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/example1/my_text_from_field.dart';
import 'package:flutter_application_1/screens/example1/widgets/textfieldE.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeExample1 extends StatelessWidget {
  HomeExample1({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                // TextFormField()
                MyCheckbox(
                  onSaved: (value) {
                    print(value);
                  },
                ),
                MyTextFormField(
                  onSaved: (value) {
                    // print(value);
                  },validator: (value) {
                    
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      
                      globalKey.currentState?.validate();
                    },
                    child: const Text('test'))
                //   TextFieldWidget(
                //     controller: emailController,
                //     type: TextInputType.emailAddress,
                //     hinttext: "email",
                //     valid: (value) {
                //       return "asd";
                //     },
                //   ),
                //   TextFieldWidget(
                //     controller: passwordController,
                //     type: TextInputType.emailAddress,
                //     hinttext: "email",
                //     valid: (value) {
                //       return "asdasd";
                //     },
                //   ),
                //        SizedBox(
                //             height: 40.h,
                //             width: 312.w,
                //             child: ElevatedButton(
                //               onPressed: () {
                //                 if (globalKey.currentState!.validate()) {
                //                   print("done");
                //                 }
                //                 return print("npew");
                //               },
                //               style: ElevatedButton.styleFrom(
                //                   backgroundColor: Color(0xFF142933),
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(4))),
                //               child: Text(
                //                 "Login",
                //                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),

                //               ),
                //             ),
                //        )
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
