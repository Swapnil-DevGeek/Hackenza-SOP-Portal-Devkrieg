import 'package:flutter/material.dart';

class ApplyNowPage extends StatefulWidget {
  final String token;
  ApplyNowPage({super.key, required this.token});
  @override
  State<ApplyNowPage> createState() => _ApplyNowPageState();
}

class _ApplyNowPageState extends State<ApplyNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ApplyNowForm(
          token: widget.token,
        ),
      ),
    );
  }
}

class ApplyNowForm extends StatefulWidget {
  final String token;
  ApplyNowForm({super.key, required this.token});
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Student ID'),
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
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
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
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
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
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Program of Study'),
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
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Justification'),
                  maxLines: 5,
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
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Submit form data here
                      // For example, send data to an API or process locally
                      // You can access the entered data using _studentId, _name, _email, _programOfStudy, _justification
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
