import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';
import 'package:sopapp/screens/student/apply.dart';
import 'package:sopapp/screens/student/myapplications.dart';

class StudentDashboard extends StatefulWidget {
  final String token;
  StudentDashboard({super.key, required this.token});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
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

  // void getrequest() async {
  //   final response = await http.get(
  //     Uri.parse('localhost:3000/api/projects/'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Department of CSIS',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ApplicationsPage()),
          );
        },
        child: Icon(Icons.assignment),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
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
              onChanged: (value) {
                filterProjects(value);
              },
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
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Apply'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ApplyNowForm(token: widget.token)),
                          );
                        }),
                  ),
                );
              },
            ),
          )
        ],
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
