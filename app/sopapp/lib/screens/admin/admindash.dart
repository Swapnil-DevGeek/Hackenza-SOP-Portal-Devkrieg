import 'package:flutter/material.dart';
import 'package:sopapp/models/project.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late List<Project> _projects;
  late List<Project> _filteredProjects;
  late TextEditingController _searchController;
  String _filter = 'All';

  @override
  void initState() {
    super.initState();
    // Initialize projects list (you would fetch this from your backend)
    _projects = [
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
    _filteredProjects = _projects;
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterProjects,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search projects...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredProjects[index].title),
                  subtitle: Text(_filteredProjects[index].researchArea),
                  trailing: Text(_filteredProjects[index].status),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _filterProjects(String query) {
    setState(() {
      _filteredProjects = _projects
          .where((project) =>
              project.title.toLowerCase().contains(query.toLowerCase()) ||
              project.researchArea
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              project.status.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (_filter != 'All') {
        _filteredProjects = _filteredProjects
            .where((project) => project.status == _filter)
            .toList();
      }
    });
  }

  void _showFilterOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter by Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('All'),
                onTap: () {
                  _updateFilter('All');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Completed'),
                onTap: () {
                  _updateFilter('Completed');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('In Progress'),
                onTap: () {
                  _updateFilter('In Progress');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateFilter(String filter) {
    setState(() {
      _filter = filter;
      _filterProjects(_searchController.text);
    });
  }
}
