import 'package:flutter/material.dart';

class Formscreen extends StatefulWidget {
  const Formscreen({Key? key}) : super(key: key);

  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(prefixIcon: Icons.person),
                  SizedBox(height: 20),
                  CustomTextField(prefixIcon: Icons.lock),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final IconData prefixIcon;

  const CustomTextField({Key? key, required this.prefixIcon}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: _controller.text.isNotEmpty || _isFocused
                ? Icon(
                    widget.prefixIcon,
                    color: _isFocused ? Colors.blue : Colors.grey,
                  )
                : Icon(
                    widget.prefixIcon,
                    color: Colors.grey,
                  ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: _isFocused ? Colors.blue : Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _isFocused ? Colors.blue : Colors.grey,
              ),
            ),
            hintText: 'Enter your text',
          ),
        ),
      ),
    );
  }
}
