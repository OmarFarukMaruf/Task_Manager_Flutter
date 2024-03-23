import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/cancelled_task_screen.dart';
import 'package:task_manager/presentation/screens/complete_task_screen.dart';
import 'package:task_manager/presentation/screens/new_task_screen.dart';
import 'package:task_manager/presentation/screens/progress_task_screen.dart';

class MainNavbarScreen extends StatefulWidget {
  const MainNavbarScreen({super.key});

  @override
  State<MainNavbarScreen> createState() => _MainNavbarScreenState();
}

class _MainNavbarScreenState extends State<MainNavbarScreen> {

   var _currentIndexNumber = 0;

  final List<Widget> _screens = [
    const NewTaskScreen(),
    const CompleteTaskScreen(),
    const ProgressTaskScreen(),
    const CancelledTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndexNumber],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndexNumber,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          _currentIndexNumber = index;
          if(mounted){
            setState(() {});
          }

        },
        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined), label: "New Task" ),
        BottomNavigationBarItem(
            icon: Icon(Icons.done_all_outlined), label: "Completed" ),
        BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits), label: "Processing" ),
        BottomNavigationBarItem(
            icon: Icon(Icons.cancel_outlined), label: "Cancelled" ),
      ],),
    );
  }
}
