import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';
import 'package:intl/intl.dart';

class TampilanRiwayat extends StatelessWidget {
  const TampilanRiwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer<KehadiranProvider>(
          builder: (context, kehadiranProvider, child) {
            if (kehadiranProvider.catatan.isEmpty) {
              return const Center(
                child: Text('Belum ada riwayat presensi'),
              );
            }

            return ListView.builder(
              itemCount: kehadiranProvider.catatan.length,
              itemBuilder: (context, index) {
                final record = kehadiranProvider.catatan[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text(
                      'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm').format(record.date)}',
                    ),
                    subtitle: Text(
                      'Hadir: ${record.jumlahhadir}, Tidak Hadir: ${record.jumlahAbsen}',
                    ),
                    children: [
                      if (record.siswaHadir.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.siswaHadir
                                .map((student) => Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text('${student.name}'),
                                    ))
                                .toList(),
                          ),
                        ),
                      if (record.siswaAbsen.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Tidak Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.siswaAbsen
                                .map((student) => Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text('${student.name} (${student.siswaId})'),
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