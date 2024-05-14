import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.onLogin, super.key});

  final Function(String, String) onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onPressed() {
    if (!formKey.currentState!.validate()) return;
    widget.onLogin(usernameController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildInputFields(context),
        const SizedBox(height: 20),
        buildLoginButton(context),
      ],
    );
  }

  Widget buildInputFields(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildAuthenticationText(),
          const SizedBox(height: 20),
          buildUsernameField(context),
          const SizedBox(height: 10),
          buildPasswordField(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildAuthenticationText() {
    return const Text(
      'Authentication',
      style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: AppColors.blackCoffee),
    );
  }

  Widget buildUsernameField(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: TextFormField(
        controller: usernameController,
        decoration: const InputDecoration(
          labelText: 'Username',
          filled: true,
          fillColor: AppColors.babyPowder,
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
        (value ?? "").isEmpty ? "Username cannot be empty" : null,
      ),
    );
  }

  Widget buildPasswordField(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: AppColors.babyPowder,
          border: OutlineInputBorder(),
        ),
        validator: (value) => (value ?? "").isEmpty
            ? "The password is required for authentication"
            : null,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.ultraRed,
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.blackCoffee,
            ),
          ),
        ),
      ),
    );
  }
}
