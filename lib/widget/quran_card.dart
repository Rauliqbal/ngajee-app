import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajee_app/models/quran.dart';
import 'package:ngajee_app/styles/colors.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({super.key, required this.qurans});
  final Qurans qurans;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Container(
          // decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF00B5AA), width: 2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  qurans.nomor.toString(),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF00B5AA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      qurans.namaLatin,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${qurans.tempatTurun} • ${qurans.jumlahAyat} Ayat',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: secondary,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                qurans.nama,
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 26,
                  color: primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
