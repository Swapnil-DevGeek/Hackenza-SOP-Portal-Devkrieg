import 'package:flutter/material.dart';

class ApplyNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ApplyNowForm(),
      ),
    );
  }
}

class ApplyNowForm extends StatefulWidget {
  @override
  _ApplyNowFormState createState() => _ApplyNowFormState();
}

class _ApplyNowFormState extends State<ApplyNowForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _studentId;
  String? _name;
  String? _email;
  String? _programOfStudy;
  String? _justification;

  final List<String> _programOfStudyOptions = ['First Degree', 'PhD'];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Student ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _studentId = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Program of Study'),
                value: _programOfStudy,
                items: _programOfStudyOptions.map((program) {
                  return DropdownMenuItem(
                    value: program,
                    child: Text(program),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _programOfStudy = value as String?;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select program of study';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Justification'),
                maxLines: null, // Allow multiple lines
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your justification';
                  }
                  return null;
                },
                onSaved: (value) {
                  _justification = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Submit form data here
                    // For example, send data to an API or process locally
                    // You can access the entered data using _studentId, _name, _email, _programOfStudy, _justification
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
