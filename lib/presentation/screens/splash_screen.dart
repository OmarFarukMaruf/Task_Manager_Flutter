import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/presentation/controller/auth_controller.dart';
import 'package:task_manager/presentation/screens/auth/sign_in_screen.dart';
import 'package:task_manager/presentation/screens/main_navbar_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToSign();
  }

  Future<void> _moveToSign() async{
    await Future.delayed(const Duration(seconds: 2));

    String? token = await AuthController.getUserToken();

    if (mounted){
      if(token == null){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SignInScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MainNavbarScreen()));

      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: Center(
        child: SvgPicture.asset('assets/images/logo.svg',
          width: 120,
          fit: BoxFit.scaleDown,
        ),
      ),)
    );
  }
}
