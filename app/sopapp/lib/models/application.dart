class StudentApplication {
  final String studentName;
  final double cgpa;
  String projectTitle = '';
  String status;
  String feedback;

  StudentApplication({
    required this.studentName,
    required this.cgpa,
    this.projectTitle = '',
    this.status = 'Pending',
    this.feedback = '',
  });
}
