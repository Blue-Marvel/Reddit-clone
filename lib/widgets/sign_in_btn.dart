import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/constant/constants.dart';
import 'package:reddit_clone/controllers/auth_controller.dart';
import 'package:reddit_clone/theme.dart/pallete.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all((deviceSize.width * 0.09)),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        label: Text(
          'Continue with google',
          style: TextStyle(fontSize: deviceSize.aspectRatio * 40),
        ),
        icon: Image.asset(
          Constants.googlePath,
          width: deviceSize.width * 0.1,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greyColor,
          minimumSize: Size(
            double.infinity,
            deviceSize.height * 0.07,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
