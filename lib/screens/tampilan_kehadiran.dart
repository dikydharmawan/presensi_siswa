import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class TampilanKehadiran extends StatelessWidget {
  const TampilanKehadiran({Key? key}) : super(key: key);

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
            child: Consumer<KehadiranProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.siswa.length,
                  itemBuilder: (context, index) {
                    final student = provider.siswa[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text('NIS: ${student.siswaId}'),
                      trailing: Checkbox(
                        value: student.isPresent,
                        onChanged: (_) => provider.toggleKehadiran(index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<KehadiranProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            onPressed: provider.hasSiswa ? provider.simpanKehadiran : null,
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