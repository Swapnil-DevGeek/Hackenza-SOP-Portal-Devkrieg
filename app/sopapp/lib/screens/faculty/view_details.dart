import 'package:flutter/material.dart';
import 'package:sopapp/models/application.dart';
import 'package:sopapp/models/project.dart';

class ViewApplicationPage extends StatefulWidget {
  final int projectid;

  ViewApplicationPage({required this.projectid});

  @override
  _ViewApplicationPageState createState() => _ViewApplicationPageState();
}

class _ViewApplicationPageState extends State<ViewApplicationPage> {
  late List<StudentApplication> studentApplications;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    studentApplications = [
      StudentApplication(studentName: 'John Doe', cgpa: 3.8),
      StudentApplication(studentName: 'Alice Smith', cgpa: 3.9),
      StudentApplication(studentName: 'Bob Johnson', cgpa: 3.5),
      StudentApplication(studentName: 'Emily Brown', cgpa: 3.7),
    ];
    sortApplications();
  }

  void sortApplications() {
    studentApplications.sort((a, b) => b.cgpa.compareTo(a.cgpa));
  }

  void searchApplications(String query) {
    setState(() {
      if (query.isNotEmpty) {
        List<StudentApplication> _searchList = [];
        studentApplications.forEach((application) {
          if (application.studentName.toLowerCase().contains(query.toLowerCase())) {
            _searchList.add(application);
          }
        });
        studentApplications = _searchList;
      } else {
        sortApplications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Applications'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Search"),
                    content: TextField(
                      controller: searchController,
                      decoration: InputDecoration(hintText: "Search by name"),
                      onChanged: (value) {
                        searchApplications(value);
                      },
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                sortApplications();
              });
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: studentApplications.length,
        itemBuilder: (context, index) {
          final studentApplication = studentApplications[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to reject the application
                      // For example:
                      // project.rejectApplication(studentApplication);
                      // setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                    ),
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
