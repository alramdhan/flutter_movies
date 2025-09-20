import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/utils/app_color.dart';
import 'package:flutter_movies/utils/app_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final AppRouter _router;

  @override
  void initState() {
    // TODO: implement initState
    _router = sl<AppRouter>();
    super.initState();
  }

  void _openBottomForm(Size size) {
    
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primary,
              AppColor.teal
            ]
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Flutter Movies",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondary
                  ),
                ).animate()
                  .fadeIn(duration: 800.ms, begin: 0)
                  .slideY(duration: 800.ms, begin: -0.1, end: 0),
                const SizedBox(height: 64),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    side: const BorderSide(width: 4, color: AppColor.light)
                  ),
                  onPressed: () {
                    _openBottomForm(size);
                  },
                  child: const Text("Sign In",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.light
                    ),
                  ),
                ).animate()
                  .fadeIn(duration: 800.ms, delay: 500.ms, begin: 0)
                  .slideY(duration: 800.ms, delay: 500.ms, begin: -0.1, end: 0),
                const SizedBox(height: 32),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    side: const BorderSide(width: 4, color: AppColor.light)
                  ),
                  onPressed: () {},
                  child: const Text("Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.light
                    ),
                  ),
                ).animate()
                  .fadeIn(duration: 800.ms, delay: 1000.ms, begin: 0)
                  .slideY(duration: 800.ms, delay: 1000.ms, begin: -0.1, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}