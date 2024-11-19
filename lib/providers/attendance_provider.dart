import 'package:flutter/foundation.dart';
import '../models/student.dart';
import '../models/attendance_record.dart';

class AttendanceProvider with ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali', studentId: '2024001'),
    Student(name: 'Budi', studentId: '2024002'),
    Student(name: 'Citra', studentId: '2024003'),
  ];

  final List<AttendanceRecord> _records = [];

  List<Student> get students => _students;
  List<AttendanceRecord> get records => _records;

  bool get hasStudents => _students.isNotEmpty;
  
  void toggleAttendance(int index) {
    _students[index].togglePresence();
    notifyListeners();
  }

  void saveAttendance() {
    final presentStudents = _students.where((student) => student.isPresent).toList();
    final absentStudents = _students.where((student) => !student.isPresent).toList();

    _records.insert(
      0,
      AttendanceRecord(
        date: DateTime.now(),
        presentCount: presentStudents.length,
        absentCount: absentStudents.length,
        presentStudents: presentStudents,
        absentStudents: absentStudents,
      ),
    );

    // Reset all students
    for (var student in _students) {
      student.reset();
    }

    notifyListeners();
  }
}