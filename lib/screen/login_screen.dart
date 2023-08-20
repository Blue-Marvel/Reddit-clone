import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/constant/constants.dart';
import 'package:reddit_clone/widgets/loader.dart';
import 'package:reddit_clone/controllers/auth_controller.dart';
import 'package:reddit_clone/widgets/sign_in_btn.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          width: deviceSize.width * 0.14,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dive into anything',
                  style: TextStyle(
                    fontSize: deviceSize.aspectRatio * 70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(
                  Constants.loginEmote,
                  height: deviceSize.height * 0.6,
                ),
                const SignInButton()
              ],
            ),
    );
  }
}
