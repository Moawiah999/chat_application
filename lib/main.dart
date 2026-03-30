import 'package:chatapp/cubits/auth_cubits/auth_cubits.dart';
import 'package:chatapp/cubits/users_cubit/users_cubit.dart';
import 'package:chatapp/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthUserCubit()),
        BlocProvider(create: (context) => UsersCubit()),
      ],

      child: ScreenUtilInit(
        designSize: Size(912, 432),
        child: MaterialApp(
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
          // showPerformanceOverlay: true,
        ),
      ),
    );
  }
}
