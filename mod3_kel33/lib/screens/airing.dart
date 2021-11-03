import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class AiringPage extends StatefulWidget {
  final String title;
  final int item;
  const AiringPage({
    Key? key,
    required this.title,
    required this.item,
  }) : super(key: key);

  @override
  _AiringPageState createState() => _AiringPageState();
}

class _AiringPageState extends State<AiringPage> {
  late Future<AiringDetail> detail;

  @override
  void initState() {
    super.initState();
    detail = fetchDetails(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: FutureBuilder<AiringDetail>(
          future: detail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(snapshot.data!.image),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.data!.title,
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(color: Colors.black, letterSpacing: .5),
                    ),
                  ),
                  Text('Score: ' + snapshot.data!.score.toString()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      snapshot.data!.synopsis,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}

class AiringDetail {
  String image;
  String title;
  String synopsis;
  num malId;
  num score;

  AiringDetail({required this.image, required this.title, required this.synopsis, required this.malId, required this.score});

  factory AiringDetail.fromJson(json) {
    return AiringDetail(
      image: json['image_url'],
      title: json['title'],
      synopsis: json['synopsis'],
      malId: json['mal_id'],
      score: json['score'],
    );
  }
}

Future<AiringDetail> fetchDetails(malId) async {
  String api = 'https://api.jikan.moe/v3/anime/$malId';
  var response = await http.get(
    Uri.parse(api),
  );
  // ignore: avoid_print
  print(response.body);

  if (response.statusCode == 200) {
    return AiringDetail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}