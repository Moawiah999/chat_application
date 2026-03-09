import 'package:chatapp/widget/auth_text_field.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shadowColor: Colors.white,
                    color: Color(0xffF0F3F7),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AuthTextField(
                              fieldName: 'Name',
                              controller: nameController,
                              hintText: 'Name',
                              icons: Icon(
                                Icons.person,
                                color: Color(0xFF00BFFF),
                              ),
                            ),
                            SizedBox(height: 20),
                            AuthTextField(
                              fieldName: 'Email',
                              controller: emailController,
                              hintText: 'Email',
                              icons: Icon(
                                Icons.email,
                                color: Color(0xFF00BFFF),
                              ),
                            ),
                            SizedBox(height: 20),
                            AuthTextField(
                              fieldName: 'Password',
                              controller: passwordController,
                              hintText: 'Password',
                              icons: Icon(Icons.lock, color: Color(0xFF00BFFF)),
                            ),
                            SizedBox(height: 20),
                            AuthTextField(
                              fieldName: 'Confirm Password',
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              icons: Icon(Icons.lock, color: Color(0xFF00BFFF)),
                            ),
                            SizedBox(height: 20),
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
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
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
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'You already have an account',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 27, 152, 253),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
