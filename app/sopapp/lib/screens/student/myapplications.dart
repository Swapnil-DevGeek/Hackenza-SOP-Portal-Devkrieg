import 'package:flutter/material.dart';
import 'package:sopapp/models/application.dart';

class ApplicationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for applications
    List<StudentApplication> applications = [
      StudentApplication(
        studentName: 'John Doe',
        projectTitle: 'Machine Learning in Healthcare',
        cgpa: 3.8,
        status: 'Accepted',
        feedback: 'Congratulations!',
      ),
      StudentApplication(
        studentName: 'Jane Smith',
        projectTitle: 'Blockchain for Supply Chain Management',
        cgpa: 3.5,
        status: 'Pending',
      ),
      StudentApplication(
        studentName: 'Alice Johnson',
        projectTitle: 'AI in Agriculture',
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                applications[index].projectTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
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
