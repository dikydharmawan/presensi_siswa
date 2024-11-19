import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer<AttendanceProvider>(
          builder: (context, attendanceProvider, child) {
            if (attendanceProvider.records.isEmpty) {
              return const Center(
                child: Text('Belum ada riwayat presensi'),
              );
            }

            return ListView.builder(
              itemCount: attendanceProvider.records.length,
              itemBuilder: (context, index) {
                final record = attendanceProvider.records[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text(
                      'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm').format(record.date)}',
                    ),
                    subtitle: Text(
                      'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
                    ),
                    children: [
                      if (record.presentStudents.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.presentStudents
                                .map((student) => Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text('${student.name}'),
                                    ))
                                .toList(),
                          ),
                        ),
                      if (record.absentStudents.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Tidak Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.absentStudents
                                .map((student) => Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text('${student.name} (${student.studentId})'),
                                    ))
                                .toList(),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}