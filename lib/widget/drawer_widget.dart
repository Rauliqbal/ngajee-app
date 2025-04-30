import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajee_app/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ngajee',
              style: GoogleFonts.rakkas(fontSize: 24, color: primary),
            ),
            const SizedBox(height: 32),

            DrawerItem(title: 'Quran', selected: true),
            DrawerItem(title: 'Doa Harian'),
            DrawerItem(title: 'Profile'),
            DrawerItem(title: 'Setting'),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse('https://rauliqbal.my.id');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Gagal membuka URL')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Give it star',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget  menu
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
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: selected ? primary : Colors.black,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
