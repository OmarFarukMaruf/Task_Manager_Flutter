import 'package:flutter/material.dart';
import 'package:task_manager/data/models/login_response.dart';
import 'package:task_manager/data/network_caller.dart';
import 'package:task_manager/data/response_object.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/controller/auth_controller.dart';
import 'package:task_manager/presentation/screens/auth/sign_up_screen.dart';
import 'package:task_manager/presentation/screens/main_navbar_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/show_snackbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _isLoginInProgress = false;

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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true){
                      return 'Enter you Email';
                    }
                    return null;
                  },
                ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEcontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter you password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _isLoginInProgress = true,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            _signIn();
                          }
                        },
                          child: const Icon(Icons.arrow_right),),
                      ),
                    ),
                            const SizedBox(height: 40),
                    Center(
                      child: TextButton(
                          onPressed: () {

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

  Future<void> _signIn()async {
  _isLoginInProgress = true;
  setState(() {});
  Map<String, dynamic> inputParams = {
    "email": _emailTEcontroller.text.trim(),
    "password": _passwordTEcontroller.text,
  };

  final ResponseObject response = await NetworkCaller.postRequest(Urls.login, inputParams);
  _isLoginInProgress = false;
  setState(() {});
  if(response.isSuccess){
    if(!mounted) {
      return;
    }

    LoginResponse loginResponse =
    LoginResponse.fromJson(response.responseBody);

    await AuthController.saveUserData(loginResponse.userData!);
    await AuthController.saveUserToken(loginResponse.token!);


    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
            builder: (context) => const MainNavbarScreen(),
        ),
            (route) => false);
  }
  else {
    if(mounted){
      showSnackBarMassage(context, response.errorMassage ?? 'Login failed! Try again');
    }
  }

  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
