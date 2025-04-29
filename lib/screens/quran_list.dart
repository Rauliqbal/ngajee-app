import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_mushaf/models/quran.dart';
import 'package:my_mushaf/widget/page_widget.dart';
import 'package:http/http.dart' as http;
import 'package:my_mushaf/widget/quran_card.dart';

class QuranList extends StatefulWidget {
  const QuranList({super.key});

  @override
  State<QuranList> createState() => _QuranListState();
}

class _QuranListState extends State<QuranList> {
  List<Qurans> list = [];
  Future<List<Qurans>> getQuranData() async {
    http.Response response =
        await http.get(Uri.parse("https://equran.id/api/v2/surat"));
    if (response.statusCode == 200) {
      try {
        var jsonResult = jsonDecode(response.body);
        var data = jsonResult['data'] as List;
        list = data.map((e) => Qurans.fromJson(e)).toList();

        print(response.body);
      } catch (e) {
        throw Exception('Failed to load Data');
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al Qur'an"),
      ),
      body: PageWidget(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<Qurans>>(
          future: getQuranData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: ((context, index) {
                  var quran = (snapshot.data as List)[index];
                  return Column(
                    children: [
                      QuranCard(
                          qurans: Qurans(
                              nomor: quran.nomor,
                              nama: quran.nama,
                              namaLatin: quran.namaLatin,
                              jumlahAyat: quran.jumlahAyat,
                              tempatTurun: quran.tempatTurun))
                    ],
                  );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: (snapshot.data as List).length,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      )),
    );
  }
}
