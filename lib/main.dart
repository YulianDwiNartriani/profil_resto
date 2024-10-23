// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = ' Rm. Nusantara';
    biodata['email'] = 'rmnusantara@gmail.com';
    biodata['phone'] = '+62812345678';
    biodata['image'] = 'resto.jpg';
    biodata['addr'] =
        '''Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131''';
    biodata['desc'] =
        '''Restoran keluarga bertema nusantara yang menyediakan manakanan khas''';
    biodata['menu'] = ' Nasi goreng \n Ayam goreng \n Sop \n Soto';
    biodata['open'] = 'Senin-Jumat 11.00-22.00 \n Sabtu-Minggu 11.00-23.00';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rumah Makan Nusantara",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RM. NUSANTARA"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            // textKotak(Colors.black, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            const SizedBox(
              height: 10,
            ),

            //tombol
            Row(children: [
              btnContact(Icons.alternate_email, Colors.green[900],
                  "mailto:${biodata['email']}?subject=Tanya%20Seputar%20Resto"),
              btnContact(Icons.map, Colors.blueAccent,
                  "https://maps.app.goo.gl/68PrSN3XXSwGHX3A7"),
              btnContact(
                  Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}"),
            ]),
            const SizedBox(
              height: 10,
            ),

            //deskripsi
            textKotak(Colors.grey, 'Deskripsi'),
            Text(
              biodata['desc'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            //menu
            textKotak(Colors.grey, 'List Menu'),
            Text(
              biodata['menu'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            //alamat
            textKotak(Colors.grey, 'Alamat'),
            Text(
              biodata['addr'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            //jam buka
            textKotak(Colors.grey, 'Jam Buka'),
            Text(
              biodata['open'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }

  Container textKotak(Color backgroundColor, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Row textAttribute(String judul, String text) {
    return Row(
      children: [
        SizedBox(
            width: 80,
            child: Text("- $judul",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        const Text(":", style: TextStyle(fontSize: 18)),
        Text(text, style: const TextStyle(fontSize: 18))
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        child: Icon(icon),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
