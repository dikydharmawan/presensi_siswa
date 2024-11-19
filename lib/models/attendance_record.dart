import 'package:presensi/models/student.dart';

class AttendanceRecord {
  final DateTime date;
  final int presentCount;
  final int absentCount;
  final List<Student> presentStudents;
  final List<Student> absentStudents;

  AttendanceRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
    required this.presentStudents,
    required this.absentStudents,
  });
}