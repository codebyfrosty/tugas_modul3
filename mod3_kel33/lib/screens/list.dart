import 'package:flutter/material.dart';

class Anggota extends StatelessWidget {
  final String nama;
  final String nim;
  final String kelompok;
  const Anggota({Key? key, required this.nama, required this.nim, required this.kelompok})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(kelompok),
      ),
      title: Text('Nama: ' + nama),
      subtitle: Text('NIM: ' + nim),
    );
  }
}