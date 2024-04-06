class StudentApplication {
  final String studentName;
  final double cgpa;
  String status;
  String feedback;

  StudentApplication({
    required this.studentName,
    required this.cgpa,
    this.status = 'Pending',
    this.feedback = '',
  });
}
