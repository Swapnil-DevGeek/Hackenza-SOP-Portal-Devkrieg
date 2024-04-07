import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';

class ProjectInputPage extends StatefulWidget {
  @override
  _ProjectInputPageState createState() => _ProjectInputPageState();
}

class _ProjectInputPageState extends State<ProjectInputPage> {
  late TextEditingController _descriptionController;
  late TextEditingController _titleController;
  late TextEditingController _researchAreaController;
  late TextEditingController _statusController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _facultyIdController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _titleController = TextEditingController();
    _researchAreaController = TextEditingController();
    _statusController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _facultyIdController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _titleController.dispose();
    _researchAreaController.dispose();
    _statusController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _facultyIdController.dispose();
    super.dispose();
  }

  void _submitForm() {
    Project project = Project(
      1, // ID should be generated as per your requirement
      _descriptionController.text,
      DateTime.parse(_startDateController.text),
      DateTime.parse(_endDateController.text),
      _facultyIdController.text,
      title: _titleController.text,
      researchArea: _researchAreaController.text,
      status: _statusController.text,
    );

    // Do something with the project object like saving it to a database or displaying it somewhere.
    print(project);

    // You can also navigate to another page or perform any other action here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Input Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _researchAreaController,
              decoration: InputDecoration(labelText: 'Research Area'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(labelText: 'Start Date (YYYY-MM-DD)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(labelText: 'End Date (YYYY-MM-DD)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _facultyIdController,
              decoration: InputDecoration(labelText: 'Faculty ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
