import 'package:presensi/models/siswa.dart';

class CatatanKehadiran {
  final DateTime date;
  final int jumlahhadir;
  final int jumlahAbsen;
  final List<Siswa> siswaHadir;
  final List<Siswa> siswaAbsen;

  CatatanKehadiran({
    required this.date,
    required this.jumlahhadir,
    required this.jumlahAbsen,
    required this.siswaHadir,
    required this.siswaAbsen,
  });
}