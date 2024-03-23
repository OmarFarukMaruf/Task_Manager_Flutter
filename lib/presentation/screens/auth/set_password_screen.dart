import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/auth/email_varification_screen.dart';
import 'package:task_manager/presentation/screens/auth/pin_screen.dart';
import 'package:task_manager/presentation/screens/auth/sign_in_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _confirmpasswordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidget(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const SizedBox(height: 100),
                      Text("Set your new password", style: Theme.of(context).textTheme.titleLarge),
                      TextFormField(
                        controller: _passwordTEcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _confirmpasswordTEcontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Confirm password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInScreen()), (route) => false);
                        },
                          child: const Icon(Icons.arrow_right),),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account?", style: TextStyle(fontSize: 16, color: Colors.black)),
                          TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInScreen()), (route) => false);
                              },
                              child: const Text('Sign In',
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
    _passwordTEcontroller.dispose();
    _confirmpasswordTEcontroller.dispose();
    super.dispose();
  }
}
