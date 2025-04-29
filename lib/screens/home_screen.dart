import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mushaf/styles/colors.dart';
import 'package:my_mushaf/widget/page_widget.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ngajee',
              style: GoogleFonts.rakkas(fontSize: 24, color: primary)),
          centerTitle: true,
          backgroundColor: Color(0xffffffff)),
      body: PageWidget(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00B5AA), Color(0xFF297C77)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Stack(
                    children: [
                      Positioned(
                          child: Image.asset(
                        'assets/images/bgpattern.png',
                      )),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Assalamualaikum',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white)),
                            Text('Raul Iqbal',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 32,
                            ),
                            TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                  hintText: 'Al-Mulk, Yasiin, Ar-Rahman',
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(Icons.search),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              suggestionsCallback: (pattern) async {
                                if (pattern.isEmpty) return [];

                                final response = await http.get(Uri.parse(
                                    'https://equran.id/api/v2/surat'));
                                if (response.statusCode == 200) {
                                  final jsonData = jsonDecode(response.body);
                                  List data = jsonData['data'];
                                  return data
                                      .where((surat) => surat['namaLatin']
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                } else {
                                  throw Exception('Failed to load surat');
                                }
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(suggestion['namaLatin']),
                                  subtitle: Text(
                                      'Surat ke-${suggestion['nomor']} • ${suggestion['jumlahAyat']} ayat'),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'Dipilih: ${suggestion['namaLatin']}'),
                                ));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]))),
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    required this.context,
    required this.title,
    required this.subTitle,
    required this.imageSrc,
  });

  final BuildContext context;
  final String title;
  final String subTitle;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(context, '/quran');
          },
          child: Container(
            height: 1000,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageSrc,
                  height: 58,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 14, color: secondary),
                )
              ],
            ),
          )),
    );
  }
}
