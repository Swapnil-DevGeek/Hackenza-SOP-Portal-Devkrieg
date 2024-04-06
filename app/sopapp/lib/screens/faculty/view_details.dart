import 'package:flutter/material.dart';
import 'package:sopapp/models/application.dart';
import 'package:sopapp/models/project.dart';

class ViewApplicationPage extends StatelessWidget {
  final int projectid;

  ViewApplicationPage({required this.projectid});

  final List<StudentApplication> studentApplications = [
    StudentApplication(studentName: 'John Doe', cgpa: 3.8),
    StudentApplication(studentName: 'Alice Smith', cgpa: 3.9),
    StudentApplication(studentName: 'Bob Johnson', cgpa: 3.5),
    StudentApplication(studentName: 'Emily Brown', cgpa: 3.7),
  ];

  @override
  Widget build(BuildContext context) {
    studentApplications.sort((a, b) => b.cgpa.compareTo(a.cgpa));

    return Scaffold(
      appBar: AppBar(
        title: Text('View Applications'),
      ),
      body: ListView.builder(
        itemCount: studentApplications.length,
        itemBuilder: (context, index) {
          final studentApplication = studentApplications[index];
          return ListTile(
            title: Text(studentApplication.studentName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CGPA: ${studentApplication.cgpa}'),
                Text('Status: ${studentApplication.status}'),
                Text('Feedback: ${studentApplication.feedback}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic to accept the application
                    // For example:
                    // project.acceptApplication(studentApplication);
                    // setState(() {});
                  },
                  child: Text('Accept'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Logic to reject the application
                    // For example:
                    // project.rejectApplication(studentApplication);
                    // setState(() {});
                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
