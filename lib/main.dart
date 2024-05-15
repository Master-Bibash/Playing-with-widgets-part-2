import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Drop_Down/DropHome.dart';
<<<<<<< HEAD
=======
import 'package:flutter_application_1/screens/animation/GuitarAdnimation/Guitar.dart';
import 'package:flutter_application_1/screens/animation/fade_adnimation/fade.dart';
import 'package:flutter_application_1/screens/connectivity_plus/connectivity.dart';
>>>>>>> 6948d9de43a31843e7e1c0901d0a73e6dcb136dd
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  
  // print(SomeClass());
  // print(SomeClass() == SomeClass());

  runApp(const MyApp());
}

// class SomeClass {
//   final int x = 1;
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const CheckInternetConnectivity(),
        // home: layoutBuidlerScreen(),
      ),
      // designSize: Size(375, 812),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final Color textColor = Color(0xB3000000);
  static final Color backgroundColor = Color(0xffF5F5F5);
  static final Color buttonColor = Color(0xff50C2C9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            "https://raw.githubusercontent.com/mustafahawari/Responsive_Login_UI/master/assets/images/top_image.png",
            height: 144.h,
            width: double.infinity,
            alignment: Alignment.topLeft,
          ),
          Text(
            "Welcome Onboard!",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          Text(
            "Let’s help you to meet your Task!",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
          SizedBox(height: 59.h),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Image.network(
              "https://raw.githubusercontent.com/mustafahawari/Responsive_Login_UI/master/assets/images/mobile.png",
              height: 186.h,
            ),
          ),
          SizedBox(height: 85.h),
          buildTextField(),
          SizedBox(height: 17.h),
          buildTextField(),
          SizedBox(height: 29.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                ),
                onPressed: () {},
                child: Text("Sign Up"),
              ),
            ),
          ),
          SizedBox(height: 28.h),
          Wrap(
            children: [
              Text(
                "Dont’t have Account ? ",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: textColor,
                ),
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: buttonColor,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Padding buildTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.w),
      child: SizedBox(
        height: 46.h,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter your name",
            hintStyle: TextStyle(
              fontSize: 11.sp,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
        ),
      ),
    );
  }
}
