import 'package:chatapp/widget/auth_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F5F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_sharp,
                    color: Color(0xFF00BFFF),
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Chating',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Form(
                key: formKey,
                child: AuthTextField(
                  fieldName: 'Email',
                  controller: emailController,
                  hintText: 'Enter your email',
                  icons: Icon(Icons.person, color: Color(0xFF00BFFF)),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0080E3),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Send the code',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
