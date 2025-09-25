import 'package:flutter/material.dart';
import 'package:flutter_movies/presentation/home/home_page.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/utils/app_router.dart';
import 'package:flutter_movies/utils/widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AppRouter _router;

  @override
  void initState() {
    _router = sl<AppRouter>();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void doLogin() {
    if(_formKey.currentState!.validate()) {
      _router.navigateTo(const HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              width: 1
            ),
          )
        ),
      ),
    );

    return SafeArea(
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome Back",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  )
                ),
                const SizedBox(height: 8),
                Text("Please enter your account",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey
                  )
                ),
                const SizedBox(height: 20),
                MTextFField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  label: "Email or Username",
                ),
                const SizedBox(height: 20),
                MTextFField(
                  controller: _passwordController,
                  obscure: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  label: "Password",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: doLogin,
                  child: const Text("Sign In",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot your password?")
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    line,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or sign in with",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                      ),
                    ),
                    line
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    side: BorderSide(color: Colors.grey.shade600),
                  ),
                  onPressed: () {},
                  icon: const FlutterLogo(),
                  label: Text("Google")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}