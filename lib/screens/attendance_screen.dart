import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Presensi Siswa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AttendanceProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    final student = provider.students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text('NIS: ${student.studentId}'),
                      trailing: Checkbox(
                        value: student.isPresent,
                        onChanged: (_) => provider.toggleAttendance(index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            onPressed: provider.hasStudents ? provider.saveAttendance : null,
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}