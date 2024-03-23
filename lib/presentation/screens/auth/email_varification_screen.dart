import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/auth/pin_screen.dart';
import 'package:task_manager/presentation/screens/auth/sign_in_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEcontroller = TextEditingController();
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
                      Text("Your Email Address", style: Theme.of(context).textTheme.titleLarge),
                      Text("A 6 digits verification pin will send to your email address", style: Theme.of(context).textTheme.titleSmall),
                      TextFormField(
                        controller: _emailTEcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PinGetScreen()));
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
    _emailTEcontroller.dispose();
    super.dispose();
  }
}
