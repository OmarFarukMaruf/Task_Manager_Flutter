import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/add_newtask_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/profil_appbar.dart';
import 'package:task_manager/presentation/widgets/task_card.dart';
import 'package:task_manager/presentation/widgets/task_counter_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar,
      body: BackgroundWidget(child: Column(
        children: [
          taskCounterSection,
          Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return  const TaskCard();
              },),)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen()));
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),

      ),
    );
  }
  Widget get taskCounterSection{
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const TaskCounterCard(
                amount: 09,
                title: "New Task",
              );
            }, separatorBuilder: (_, __) {
          return const SizedBox(width: 8.0);

        }, itemCount: 4),
      ),
    );
  }


}




