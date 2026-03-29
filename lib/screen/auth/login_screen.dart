import 'package:chatapp/cubits/auth_cubits/auth_cubits.dart';
import 'package:chatapp/cubits/auth_cubits/auth_user_state.dart';
import 'package:chatapp/screen/auth/forgot_password.dart';
import 'package:chatapp/screen/auth/registration_screen.dart';
import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/widget/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 80.h),
              child: Card(
                shadowColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                color: Color(0xffF0F3F7),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_sharp,
                              color: Color(0xFF00BFFF),
                              size: 65.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'Chating',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 49.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h),
                        AuthTextField(
                          keyboardType: TextInputType.emailAddress,
                          fieldName: 'Email',
                          controller: emailController,
                          hintText: 'Email',
                          icons: Icon(Icons.email, color: Color(0xFF00BFFF)),
                        ),
                        SizedBox(height: 10.h),
                        AuthTextField(
                          obscureText: true,
                          fieldName: 'Password',
                          controller: passwordController,
                          hintText: 'Password',
                          icons: Icon(Icons.lock, color: Color(0xFF00BFFF)),
                        ),
                        SizedBox(height: 25.h),
                        BlocConsumer<AuthUserCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSuccessfulLogin) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else if (state is AuthInvalidCredentials) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Email or password incorrect'),
                                ),
                              );
                            } else if (state is AuthUserNotFound) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('User not found')),
                              );
                            } else if (state is AuthFailedLogin) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed Login')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff0080E3),
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthUserCubit>(
                                      context,
                                    ).login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                child: state is AuthLoading
                                    ? SizedBox(
                                        height: 20.h,
                                        width: 20.w,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2.r,
                                        ),
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35.sp,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10.h),
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
                        SizedBox(height: 7.h),
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
                        SizedBox(height: 10.h),
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
