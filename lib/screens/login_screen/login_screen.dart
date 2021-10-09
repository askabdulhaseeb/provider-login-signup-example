import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/user_provider.dart';
import 'package:provider_example/screens/landing_screen/landing_screen.dart';
import 'package:provider_example/screens/signup_screen/signup_screen.dart';
import 'package:provider_example/screens/widget/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: _email,
              title: 'Email',
              hint: 'test@test.com',
            ),
            CustomTextFormField(controller: _password, title: 'Password'),
            ElevatedButton(
              onPressed: () {
                final bool _isfound =
                    provider.login(_email.text, _password.text);
                if (_isfound) {
                  Navigator.of(context).pushNamed(LandingScreen.routeName);
                }
              },
              child: const Text('Login'),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('''Don't have an account?'''),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                    child: const Text('Sign up')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
