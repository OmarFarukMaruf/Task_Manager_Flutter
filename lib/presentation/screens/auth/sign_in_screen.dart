import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/auth/email_varification_screen.dart';
import 'package:task_manager/presentation/screens/auth/sign_up_screen.dart';
import 'package:task_manager/presentation/screens/main_navbar_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 100),
                 Text("Get start with", style: Theme.of(context).textTheme.titleLarge),
                TextFormField(
                  controller: _emailTEcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEcontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainNavbarScreen()), (route) => false);
                      },
                        child: const Icon(Icons.arrow_right),),
                    ),
                            const SizedBox(height: 40),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailVerificationScreen()));
                          },
                          child: const Text('Forgot Password?',
                            style: TextStyle(fontSize: 16, color: Colors.grey),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("Don't have an account?", style: TextStyle(fontSize: 16, color: Colors.black)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                          },
                          child: const Text('Sign Up',
                            style: TextStyle(fontSize: 16, color: Colors.green),)),
                    ],)
                        ],
                      ),
              ),
            ),
          ))
      );
  }
  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
