class Project {
  final int id;
  final String title;
  final String researchArea;
  final String status;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String facultyId;

  Project(this.id, this.description, this.startDate, this.endDate, this.facultyId, 
      {required this.title, required this.researchArea, required this.status});
}
