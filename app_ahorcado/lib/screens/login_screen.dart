import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'first_name': 'JP',
      'last_name': 'Rivillas',
      'email': 'jprivillas98@gmail.com',
      'pass': 'antarox2k98',
      'role': 'admin',
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Form(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'user',
                  helperText: 'User Name',
                  hintText: 'User Name',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(height: 15),
                CustomInputField(
                  labelText: 'pass',
                  helperText: 'Password',
                  hintText: 'Password',
                  obscureText: true,
                  formProperty: 'pass',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'home'),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
