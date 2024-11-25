import 'package:flutter/foundation.dart';
import '../models/siswa.dart';
import '../models/catatan_kehadiran.dart';

class KehadiranProvider with ChangeNotifier {
  final List<Siswa> _siswa = [
    Siswa(name: 'Ali', siswaId: '2024001'),
    Siswa(name: 'Budi', siswaId: '2024002'),
    Siswa(name: 'Citra', siswaId: '2024003'),
  ];

  final List<CatatanKehadiran> _catatan = [];

  List<Siswa> get siswa => _siswa;
  List<CatatanKehadiran> get catatan => _catatan;

  bool get hasSiswa => _siswa.isNotEmpty;
  
  void toggleKehadiran(int index) {
    _siswa[index].togglePresence();
    notifyListeners();
  }

  void simpanKehadiran() {
    final siswaHadir = _siswa.where((siswa) => siswa.isPresent).toList();
    final siswaAbsen = _siswa.where((siswa) => !siswa.isPresent).toList();

    _catatan.insert(
      0,
      CatatanKehadiran(
        date: DateTime.now(),
        jumlahhadir: siswaHadir.length,
        jumlahAbsen: siswaAbsen.length,
        siswaHadir: siswaHadir,
        siswaAbsen: siswaAbsen,
      ),
    );

    // Reset semua siswa
    for (var siswa in _siswa) {
      siswa.reset();
    }

    notifyListeners();
  }
}