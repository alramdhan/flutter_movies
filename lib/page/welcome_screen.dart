import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_movies/page/auth/login_page.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/utils/app_color.dart';
import 'package:flutter_movies/utils/app_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // bool _bottomSheet = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _bottomSheetController;
  late final AppRouter _router;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _openBottomForm({required bool loginForm, required bool show}) {
    if(show) {
      _bottomSheetController = _scaffoldKey.currentState?.showBottomSheet(
        // showDragHandle: true,
        (context) {
          final Size size = MediaQuery.sizeOf(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .72,
                width: size.width * .90,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                ),
              ),
              Container(
                height: size.height * .7,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                ),
                child: loginForm ? const LoginPage() : const Text("Bottom"),
              ),
            ],
          );
        },
        backgroundColor: Colors.transparent
      );
    } else {
      if(_bottomSheetController != null) _bottomSheetController?.close();
      _bottomSheetController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primary,
              AppColor.teal
            ],
          ),
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
                    _openBottomForm(loginForm: true, show: true);
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
                  onPressed: () {
                    _openBottomForm(loginForm: false, show: true);
                  },
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