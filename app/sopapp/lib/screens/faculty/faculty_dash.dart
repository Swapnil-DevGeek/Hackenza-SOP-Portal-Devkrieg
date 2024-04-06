import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';
import 'package:sopapp/screens/faculty/add_faculty_project.dart';
import 'package:sopapp/screens/faculty/view_details.dart';

class FacultyDashboard extends StatefulWidget {
  @override
  _FacultyDashboardState createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  List<Project> filteredProjects = List.from(projects);
  TextEditingController searchController = TextEditingController();
  String selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Dashboard'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButton<String>(
              value: selectedStatus,
              icon: Icon(Icons.filter_alt),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedStatus = newValue!;
                  filterProjects(selectedStatus);
                });
              },
              items: <String>['All', 'Completed', 'In Progress', 'Pending']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filterProjects(selectedStatus);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(project.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text('Research Area: ${project.researchArea}'),
                          SizedBox(height: 4),
                          Text('Status: ${project.status}'),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewApplicationPage(projectid: project.id,),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewApplicationPage(projectid: project.id),
                          ),
                        );
                      },
                    ),
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
        child: Icon(Icons.add),
      ),
    );
  }

  void filterProjects(String status) {
    setState(() {
      filteredProjects = projects.where((project) {
        if (status == 'All') {
          return project.title.toLowerCase().contains(searchController.text.toLowerCase());
        } else {
          return project.title.toLowerCase().contains(searchController.text.toLowerCase()) &&
              project.status.toLowerCase() == status.toLowerCase();
        }
      }).toList();
    });
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
