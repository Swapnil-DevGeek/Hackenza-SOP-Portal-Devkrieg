// import 'package:flutter/material.dart';
// import 'package:sopapp/models/project.dart';

// class StudentDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Dashboard'),
//       ),
//       body: ListView.builder(
//         itemCount: projects.length,
//         itemBuilder: (context, index) {
//           final project = projects[index];
//           return ListTile(
//             title: Text(project.title),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Project title: ${project.title}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// final List<Project> projects = [
//   Project(
//     1,
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
//     DateTime(2023, 1, 1),
//     DateTime(2023, 12, 31),
//     "faculty1",
//     title: "Project 1",
//     researchArea: "Area A",
//     status: "Completed",
//   ),
//   Project(
//     2,
//     "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//     DateTime(2024, 3, 15),
//     DateTime(2024, 9, 15),
//     "faculty2",
//     title: "Project 2",
//     researchArea: "Area B",
//     status: "In Progress",
//   ),
//   Project(
//     3,
//     "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//     DateTime(2024, 6, 1),
//     DateTime(2025, 6, 1),
//     "faculty3",
//     title: "Project 3",
//     researchArea: "Area C",
//     status: "Pending",
//   ),
// ];
