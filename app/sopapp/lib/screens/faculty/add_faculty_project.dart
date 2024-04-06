import 'package:flutter/material.dart';

class AddProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Project'),
      ),
      body: const Center(
        child: Text('This is where you can add a new project.'),
      ),
    );
  }
}
