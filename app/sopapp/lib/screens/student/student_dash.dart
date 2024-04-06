import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';
import 'package:sopapp/screens/student/apply.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  late List<Project> filteredProjects;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProjects = projects;
  }

  void filterProjects(String query) {
    List<Project> filteredList = projects.where((project) {
      return project.title.toLowerCase().contains(query.toLowerCase()) ||
          project.researchArea.toLowerCase().contains(query.toLowerCase()) ||
          project.status.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredProjects = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
        centerTitle: true,
        actions: [
          // Removed the search button
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                hintText: "Search by title, area, or status",
                filled: true,
                fillColor:
                    Colors.black.withOpacity(0.1), // Darkened background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                filterProjects(value);
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProjects.length,
        itemBuilder: (context, index) {
          final project = filteredProjects[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  project.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Research Area: ${project.researchArea}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Status: ${project.status}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyNowForm(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange.shade900, // Text color
                  ),
                  child: Text('Apply'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Project> projects = [
  Project(
    1,
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    DateTime(2023, 1, 1),
    DateTime(2023, 12, 31),
    "faculty1",
    title: "Project 1",
    researchArea: "Area A",
    status: "Completed",
  ),
  Project(
    2,
    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    DateTime(2024, 3, 15),
    DateTime(2024, 9, 15),
    "faculty2",
    title: "Project 2",
    researchArea: "Area B",
    status: "In Progress",
  ),
  Project(
    3,
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    DateTime(2024, 6, 1),
    DateTime(2025, 6, 1),
    "faculty3",
    title: "Project 3",
    researchArea: "Area C",
    status: "Pending",
  ),
];
