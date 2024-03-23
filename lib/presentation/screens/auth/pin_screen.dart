import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/presentation/screens/auth/set_password_screen.dart';
import 'package:task_manager/presentation/screens/auth/sign_in_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class PinGetScreen extends StatefulWidget {
  const PinGetScreen({super.key});

  @override
  State<PinGetScreen> createState() => _PinGetScreenState();
}

class _PinGetScreenState extends State<PinGetScreen> {

  final TextEditingController _pinTEcontroller = TextEditingController();
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
                      Text("Pin Verification", style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text("A 6 digits verification pin has sent to your email address", style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 32),
                      PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          inactiveColor: Colors.green,
                          selectedFillColor: Colors.grey,

                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        
                        onCompleted: (v) {
                        }, appContext: context,
                        
                      ),

                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SetPasswordScreen()));
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
    _pinTEcontroller.dispose();
    super.dispose();
  }
}
