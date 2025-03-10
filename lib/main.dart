import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/theme/app_theme.dart';
import 'package:games/core/utils/setup_service_locator.dart';
import 'package:games/feature/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:games/feature/splash_screen/splash_screen.dart';
import 'package:games/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(signUpUsecase: sl(), loginUsecase: sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(), // Set SplashScreen as the initial route
      ),
    );
  }
}
