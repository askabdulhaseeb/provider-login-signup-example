import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/book_provider.dart';
import 'package:provider_example/providers/user_provider.dart';
import 'package:provider_example/screens/landing_screen/landing_screen.dart';
import 'package:provider_example/screens/login_screen/login_screen.dart';
import 'package:provider_example/screens/signup_screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: BookProvider()),
      ],
      child: MaterialApp(
        title: 'Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        routes: {
          LoginScreen.routeName: (_) => const LoginScreen(),
          SignupScreen.routeName: (_) => const SignupScreen(),
          LandingScreen.routeName: (_) => const LandingScreen(),
        },
      ),
    );
  }
}
