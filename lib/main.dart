import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final resto = <String, String>{};
  MainApp({super.key}) {
    resto['nama'] = 'Tekodeko';
    resto['gambar'] = 'Gambar.png';
    resto['email'] = 'tekodeko@gmail.com';
    resto['telp'] = '+6282324213885';
    resto['maps'] = 'https://maps.app.goo.gl/gR814vzQuXMkPUxv7';
    resto['deskripsi'] = '''
Salah satu cafe/kedai kopi yang terletak di Kawasan Kota Lama Semarang. Ciri khas dari kopi yang ada di kedai ini adalah kopi Semarangannya''';
    resto['alamat'] = '''
Jl. Kepodang No.64, Kota Lama, Purwodinatan, Kec. Semarang Tengah, 
Kota Semarang, Jawa Tengah 50137''';
    resto['jam_buka'] = '09.00';
    resto['jam_tutup'] = '22.00';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Profil Resto',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Aplikasi Profil Restoran',
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black87, resto['nama'] ?? ''),
            Image(image: AssetImage("assets/${resto['gambar'] ?? ''}")),
            Row(children: [
              btnContact(
                  Icons.email, Colors.red[400], "mailto:$resto['email']"),
              btnContact(Icons.phone, Colors.blue[400],
                  "https://wa.me/${resto['telp']}"),
              btnContact(
                  Icons.map_outlined, Colors.green[500], resto['maps'] ?? '')
            ]),
            const SizedBox(height: 30),
            teksKotak(Colors.black54, 'Deskripsi'),
            const SizedBox(height: 10),
            Text(
              resto['deskripsi'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            teksKotak(Colors.black54, 'List Menu'),
            const SizedBox(height: 10),
            textAttribute('Es Kopi Susu Gendhis', '24.000'),
            textAttribute('Kopi Gendhis', '34.000'),
            textAttribute('Caffe Latte  1L', '85.000'),
            textAttribute('Chocolate 1L', '85.000'),
            const SizedBox(height: 30),
            teksKotak(Colors.black54, 'Alamat'),
            const SizedBox(height: 10),
            Text(
              resto['alamat'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            teksKotak(Colors.black54, 'Jam Buka'),
            const SizedBox(height: 10),
            Text(
              '- Buka: ${resto['jam_buka']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              '- Tutup: ${resto['jam_tutup']}',
              style: const TextStyle(fontSize: 18),
            ),
          ]),
        ),
      ),
    );
  }

  Container teksKotak(var bgColor, String teks) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(teks,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
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
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        child: Icon(icon),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 280,
          child: Text("- $judul",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(":", style: TextStyle(fontSize: 18)),
        Text(teks, style: TextStyle(fontSize: 18)),
      ],
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
