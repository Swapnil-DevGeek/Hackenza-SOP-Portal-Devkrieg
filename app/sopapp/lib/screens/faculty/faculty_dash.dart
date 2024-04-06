import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';
import 'package:sopapp/screens/faculty/add_faculty_project.dart';

class FacultyDashboard extends StatefulWidget {
  @override
  _FacultyDashboardState createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  List<Project> filteredProjects = List.from(projects);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filteredProjects = projects
                      .where((project) =>
                          project.title.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search by title',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return ListTile(
                  title: Text(project.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Project title: ${project.title}'),
                      Text('Research Area: ${project.researchArea}'),
                      Text('Status: ${project.status}'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Navigate to view application page
                      // You can pass project details to the next screen if needed
                    },
                    child: const Text('View Application'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProjectPage()),
          );
        },
        child: const Icon(Icons.add),
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
