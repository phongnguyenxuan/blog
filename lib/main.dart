import 'package:blog/config/custom_color.dart';
import 'package:blog/firebase_options.dart';
import 'package:blog/provider/user_provider.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:blog/screen/login/auth_state.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:blog/screen/login/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 683.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => UserProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
              useMaterial3: true,
            ),
            initialRoute: AuthState.id,
            routes: {
              LoginScreen.id: (_) => const LoginScreen(),
              RegisterScreen.id: (_) => const RegisterScreen(),
              AuthState.id: (_) => const AuthState(),
              HomeScreen.id: (_) => const HomeScreen()
            },
          ),
        );
      },
    );
  }
}
