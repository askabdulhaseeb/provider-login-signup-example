import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/app_user.dart';
import 'package:provider_example/providers/user_provider.dart';
import 'package:provider_example/screens/widget/custom_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String routeName = '/SignupScreen';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: _name,
              title: 'Name',
            ),
            CustomTextFormField(
              controller: _email,
              title: 'Email',
              hint: 'test@test.com',
            ),
            CustomTextFormField(controller: _password, title: 'Password'),
            CustomTextFormField(
              controller: _confirmPassword,
              title: 'Confirm Password',
            ),
            ElevatedButton(
              onPressed: () {
                if (_password.text == _confirmPassword.text) {
                  final AppUser _user = AppUser(
                    uid: DateTime.now().millisecond.toString(),
                    email: _email.text,
                    name: _name.text,
                    password: _password.text,
                  );
                  provider.addUser(_user);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
