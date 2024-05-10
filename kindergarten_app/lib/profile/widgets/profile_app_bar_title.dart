import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kindergarten_app/authentication/bloc/login_bloc.dart';
import 'package:kindergarten_app/authentication/models/events.dart';
import 'package:kindergarten_app/authentication/screens/login_screen.dart';
import '../../app_colors.dart';


class ProfileAppBarTitle extends StatelessWidget {
  final String username;
  final String jwt;

  const ProfileAppBarTitle({Key? key, required this.username, required this.jwt}) : super(key: key);

  void _logout(BuildContext context) {
    // Dispatch the logout event
    context.read<LoginBloc>().add(ClientWantsToLogout(
      eventType: ClientWantsToLogout.eventName,
      jwt: jwt,
    ));

    // Navigate to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome $username',
          style: const TextStyle(
            color: AppColors.blackCoffee,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        TextButton(
          onPressed: () => _logout(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.ultraRed),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(
              color: AppColors.blackCoffee,
            ),
          ),
        ),
      ],
    );
  }
}
