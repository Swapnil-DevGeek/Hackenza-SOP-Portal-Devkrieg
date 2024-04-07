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
        title: const Text('Faculty Dashboard',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: DropdownButton<String>(
              value: selectedStatus,
              icon: Icon(Icons.filter_alt),
              iconSize: 30,
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
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: 'Search projects....',
                filled: true,
                fillColor: Colors.black.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
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
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.library_books_sharp),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Research Area: ${project.researchArea}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewApplicationPage(
                              projectid: project.id,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewApplicationPage(projectid: project.id),
                        ),
                      );
                    },
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
            MaterialPageRoute(builder: (context) => ProjectInputPage()),
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
          return project.title
              .toLowerCase()
              .contains(searchController.text.toLowerCase());
        } else {
          return project.title
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) &&
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
