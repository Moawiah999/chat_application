import 'package:chatapp/screen/auth/forgot_password.dart';
import 'package:chatapp/screen/auth/registration_screen.dart';
import 'package:chatapp/widget/auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 80),
              child: Card(
                shadowColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: Color(0xffF0F3F7),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
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
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        AuthTextField(
                          fieldName: 'Email',
                          controller: emailController,
                          hintText: 'Email',
                          icons: Icon(Icons.email, color: Color(0xFF00BFFF)),
                        ),
                        SizedBox(height: 20),
                        AuthTextField(
                          obscureText: true,
                          fieldName: 'Password',
                          controller: passwordController,
                          hintText: 'Password',
                          icons: Icon(Icons.lock, color: Color(0xFF00BFFF)),
                        ),
                        SizedBox(height: 30),
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
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPassword();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 27, 152, 253),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegistrationScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Create a new account',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 27, 152, 253),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
