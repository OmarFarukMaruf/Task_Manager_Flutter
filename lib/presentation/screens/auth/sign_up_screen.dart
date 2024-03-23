import 'package:flutter/material.dart';
import 'package:task_manager/data/network_caller.dart';
import 'package:task_manager/data/response_object.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/show_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _mobileTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _isRegistrationInProgress = false;

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
                      Text("Join with us", style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailTEcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter you email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _firstNameTEcontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'First name',
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter you first name';
                          }
                          return null;
                        },

                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _lastNameTEcontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Last name',
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter you last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _mobileTEcontroller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Mobile',
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter you phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordTEcontroller,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter you password';
                          }
                          if (value!.length <= 6) {
                            return 'Password should more the 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _isRegistrationInProgress = true,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                            if (_fromKey.currentState!.validate()) {
                              _isRegistrationInProgress = true;
                              setState(() {});
                              Map<String, dynamic> inputParams = {
                                "email": _emailTEcontroller.text.trim(),
                                "firstName": _firstNameTEcontroller.text.trim(),
                                "lastName": _lastNameTEcontroller.text.trim(),
                                "mobile": _mobileTEcontroller.text.trim(),
                                "password": _passwordTEcontroller.text,
                              };

                              final ResponseObject response = await NetworkCaller.postRequest(
                                  Urls.registration, inputParams);
                              _isRegistrationInProgress = false;
                              setState(() {});
                              if (response.isSuccess) {
                                if (mounted) {
                                  showSnackBarMassage(
                                      context, "Registration successful");
                                  Navigator.pop(context);
                                }
                              }
                              else {
                                if (mounted) {
                                  showSnackBarMassage(
                                      context, "Registration failed! Try again", true);
                                }
                              }
                            }
                          },
                            child: const Icon(Icons.arrow_right),),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account?", style: TextStyle(fontSize: 16, color: Colors.black)),
                          TextButton(
                              onPressed: () {

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
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
