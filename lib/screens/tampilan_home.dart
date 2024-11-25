import 'package:flutter/material.dart';
import 'tampilan_kehadiran.dart';
import 'tampilan_riwayat.dart';

class TampilanHome extends StatefulWidget {
  const TampilanHome({Key? key}) : super(key: key);

  @override
  State<TampilanHome> createState() => _TampilanHomestate();
}

class _TampilanHomestate extends State<TampilanHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TampilanKehadiran(),
    const TampilanRiwayat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}