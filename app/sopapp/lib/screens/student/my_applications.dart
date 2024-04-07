import 'package:flutter/material.dart';
import 'package:sopapp/models/application.dart';

class ApplicationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for applications
    List<StudentApplication> applications = [
      StudentApplication(
        studentName: 'John Doe',
        cgpa: 3.8,
        status: 'Accepted',
        feedback: 'Congratulations!',
      ),
      StudentApplication(
        studentName: 'Jane Smith',
        cgpa: 3.5,
        status: 'Pending',
      ),
      StudentApplication(
        studentName: 'Alice Johnson',
        cgpa: 3.9,
        status: 'Rejected',
        feedback: 'Not meeting minimum requirements.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applications'),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(
                applications[index].studentName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('CGPA: ${applications[index].cgpa.toString()}'),
                  const SizedBox(height: 4),
                  Text('Status: ${applications[index].status}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(applications[index].status))),
                  const SizedBox(height: 4),
                  if (applications[index].feedback.isNotEmpty)
                    Text('Feedback: ${applications[index].feedback}'),
                ],
              ),
              onTap: () {
                // Handle tap on application to view details if needed
              },
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}