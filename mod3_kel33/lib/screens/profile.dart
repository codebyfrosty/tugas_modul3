import 'package:flutter/material.dart';
import 'package:mod3_kel33/screens/list.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Profile Kelompok 33",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
          ),
        ),
      ),
      body: Column(
        children: const [
          Anggota(
            nama: "Paquita Putri Ababil",
            nim: "21120119120030",
            kelompok: "33",
          ),
          Anggota(
            nama: "Saifudin Nur Alfianto",
            nim: "21120119130087",
            kelompok: "33",
          ),
          Anggota(
            nama: "Nadia",
            nim: "21120119120023",
            kelompok: "33",
          ),
          Anggota(
            nama: "Hilmi Ahmad Dhiya'ulhaq",
            nim: "21120119130048",
            kelompok: "33",
          ),
        ],
      ),
    );
  }
}