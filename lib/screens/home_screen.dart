import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajee_app/models/quran.dart';
import 'package:ngajee_app/styles/colors.dart';
import 'package:ngajee_app/widget/drawer_widget.dart';
import 'package:ngajee_app/widget/page_widget.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ngajee_app/widget/quran_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Qurans>> _quranFuture;

  @override
  void initState() {
    super.initState();
    _quranFuture = getQuranData();
  }

  Future<List<Qurans>> getQuranData() async {
    try {
      final response = await http.get(
        Uri.parse("https://equran.id/api/v2/surat"),
      );
      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);
        final data = jsonResult['data'] as List;
        return data.map((e) => Qurans.fromJson(e)).toList();
      } else {
        throw Exception('Gagal mengambil data (status ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ngajee',
          style: GoogleFonts.rakkas(fontSize: 24, color: primary),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: buildAppDrawer(context),
      body: PageWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              _buildGreetingHeader(),
              const SizedBox(height: 24),
              FutureBuilder<List<Qurans>>(
                future: _quranFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi kesalahan: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Tidak ada data'));
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    separatorBuilder:
                        (_, __) =>
                            const Divider(height: 1, color: Color(0xffCBD5E1)),
                    itemBuilder: (context, index) {
                      final quran = snapshot.data![index];
                      return QuranCard(qurans: quran);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00B5AA), Color(0xFF297C77)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        children: [
          Positioned(child: Image.asset('assets/images/bgpattern.png')),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamualaikum',
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Raul Iqbal',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32),
                _buildSearchField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TypeAheadField<dynamic>(
      suggestionsCallback: (pattern) async {
        if (pattern.isEmpty) return [];

        final response = await http.get(
          Uri.parse('https://equran.id/api/v2/surat'),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final data = jsonData['data'] as List;
          return data
              .where(
                (surat) => surat['namaLatin'].toLowerCase().contains(
                  pattern.toLowerCase(),
                ),
              )
              .toList();
        } else {
          return [];
        }
      },
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Al-Mulk,Yasiin,Al-Waqi`ah',
            hintStyle: TextStyle(fontSize: 14, color: secondary),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      },

      itemBuilder: (context, dynamic suggestion) {
        return ListTile(
          title: Text(suggestion['namaLatin']),
          subtitle: Text(
            'Surat ke-${suggestion['nomor']} • ${suggestion['jumlahAyat']} ayat',
          ),
        );
      },
      onSelected: (dynamic suggestion) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dipilih: ${suggestion['namaLatin']}')),
        );
      },
    );
  }
}
