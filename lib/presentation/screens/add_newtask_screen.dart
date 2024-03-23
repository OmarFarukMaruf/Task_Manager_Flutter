import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/profil_appbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleETController = TextEditingController();
  final TextEditingController _descriptionETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar,
      body: BackgroundWidget(child:
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Text("Add New Task", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleETController,
                decoration: const InputDecoration(
                  hintText: "Title"
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionETController,
                maxLines: 6,
                decoration: const InputDecoration(
                    hintText: "Description"
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
            ],
          ),
        ),
      ),),
    );
  }
  @override
  void dispose() {
    _titleETController.dispose();
    _descriptionETController.dispose();
    super.dispose();
  }
}
