
import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/presentation/screens/auth/sign_in_screen.dart';
import 'package:task_manager/presentation/screens/profile_editing_screen.dart';

PreferredSizeWidget get  profileAppbar {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.green,
    title: TextButton(
      onPressed: () {
        Navigator.push(TaskManager.navigatorKey.currentState!.context, MaterialPageRoute(builder: (context) => const ProfileEditingScreen()));
      },
      child: Row(
        children: [
        const CircleAvatar(),
        const SizedBox(width: 8,),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Omar Faruk", style: TextStyle(color: Colors.white, fontSize: 16),),
            Text("omarfaruk4543@gmail.com", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 14))
          ],),
        ), IconButton(onPressed: () {
          Navigator.pushAndRemoveUntil(TaskManager.navigatorKey.currentState!.context, MaterialPageRoute(builder: (context) => const SignInScreen()), (route) => false);
          }, icon: const Icon(Icons.logout))
      ],),
    ),

  );
}