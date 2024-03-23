import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/profil_appbar.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _fnameTEController = TextEditingController();
  final TextEditingController _lnameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar,
      body: BackgroundWidget(child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Text("Update Profile", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))

                      ),
                      child: const Text("Photo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8,),
                    const Text("Image.jpg")
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: "Email"
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _fnameTEController,
                decoration: const InputDecoration(
                    hintText: "First Name"
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lnameTEController,
                decoration: const InputDecoration(
                    hintText: "Last Name"
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _mobileTEController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Mobile"
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
                decoration: const InputDecoration(
                    hintText: "Password"
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                },
                  child: const Icon(Icons.arrow_right),),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _fnameTEController.dispose();
    _lnameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
