import 'package:flutter/material.dart';
import 'package:flutter_movies/presentation/welcome_screen.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/utils/app_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AppRouter _router;

  @override
  void initState() {
    // TODO: implement initState
    _router = sl<AppRouter>();
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener(_animationStatus);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeStatusListener(_animationStatus);
    _controller.dispose();
    super.dispose();
  }

  void _animationStatus(status) async {
    print("status $status");
    if(status == AnimationStatus.completed) {
      await Future.delayed(const Duration(seconds: 2), () {
        _router.navigateTo(const WelcomeScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            "assets/lottie/movie_theatre.json",
            controller: _controller,
            onLoaded: (compotion) {
              _controller
                ..duration = compotion.duration
                ..forward();
            }
          ),
        ),
      ),
    );
  }
}