import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajee_app/styles/colors.dart';

Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Ngajee',
              style: GoogleFonts.rakkas(fontSize: 24, color: primary),
            ),
            const SizedBox(height: 32),

            // Menu items
            DrawerItem(title: 'Quran', selected: true),
            DrawerItem(title: 'Doa Harian'),
            DrawerItem(title: 'Profile'),
            DrawerItem(title: 'Setting'),

            const Spacer(),

            // Button at the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Give it star'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget untuk item menu
class DrawerItem extends StatelessWidget {
  final String title;
  final bool selected;

  const DrawerItem({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: selected ? primary : Colors.black,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
