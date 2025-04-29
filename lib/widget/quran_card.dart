import 'package:flutter/material.dart';
import 'package:my_mushaf/models/quran.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({super.key, required this.qurans});
  final Qurans qurans;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(posts.id.toString()),
            Text(
              qurans.nama,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(qurans.namaLatin),
            // Text(qurans.jumlatAyat.toString()),
            // Text(qurans.nomor.toString()),
          ],
        ),
      ),
    );
  }
}
