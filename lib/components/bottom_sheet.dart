import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tech_news/utils/text.dart';

class NewsDetailBottomSheet extends StatelessWidget {
  const NewsDetailBottomSheet(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.url,
      required this.description});

  final String title, imageUrl, url, description;

    Future<void> _launchUrl() async {
      final Uri _url = Uri.parse(url);
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  left: 10,
                  right: 10,
                  bottom: 8,
                  child: BoldText(text: title, size: 18, color: Colors.white))
            ],
          ),
        ),
        Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: ModifiedText(
                      text: description,
                      size: 16,
                      color: Colors.white.withOpacity(0.8)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl();
                        },
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.blue.shade400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
