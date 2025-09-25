import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_movies/presentation/auth/login_page.dart';
import 'package:flutter_movies/presentation/auth/signup_page.dart';
import 'package:flutter_movies/utils/themes/app_color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  bool _showBS = false;
  bool _login = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _bottomSheetController;
  late final AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: 800.ms);
    super.initState();
    _animationController.addStatusListener(_acStatusListener);
  }

  void _acStatusListener(AnimationStatus status) {
    print("Status: $status");
    if(status == AnimationStatus.dismissed) {
      setState(() {
        _showBS = false;
      });
    }
  }

  void _openBottomForm({required bool loginForm, required bool show}) {
    _login = loginForm;
    if(show) {
      _bottomSheetController = _scaffoldKey.currentState?.showBottomSheet(
        // showDragHandle: true,
        transitionAnimationController: _animationController,
        (context) {
          final Size size = MediaQuery.sizeOf(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .755,
                width: size.width * .915,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor.withAlpha(125),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(25))
                ),
              ),
              Container(
                height: size.height * .74,
                width: size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15))
                ),
                child: loginForm ? const LoginPage() : const SignupPage(),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primary,
              AppColor.secondary
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.sizeOf(context).height * .09,
              left: 10,
              right: 20,
              child: AnimatedOpacity(
                opacity: _showBS ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showBS = false;
                          _openBottomForm(loginForm: _login, show: false);
                        });
                      },
                      icon: const Icon(Icons.chevron_left, color: AppColor.dark),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_login ? "Doesn't have an account?" : "Already have an account?",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColor.dark,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.light.withAlpha(100),
                              elevation: 0,
                              minimumSize: const Size.fromHeight(40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                              ),
                              padding: EdgeInsets.zero
                            ),
                            onPressed: () async {
                              _bottomSheetController?.close();
                              await _bottomSheetController?.closed;
                              _bottomSheetController = null;
                              await Future.delayed(800.ms);
                              setState(() {
                                _showBS = true;
                                _openBottomForm(loginForm: !_login, show: true);
                              });
                            },
                            child: Text(_login ? "Sign Up" : "Sign In",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.dark
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Flutter Movies",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.light
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
                      setState(() {
                        _showBS = true;
                        _openBottomForm(loginForm: true, show: true);
                      });
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
                      setState(() {
                        _showBS = true;
                        _openBottomForm(loginForm: false, show: true);
                      });
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
          ],
        ),
      ),
    );
  }
}