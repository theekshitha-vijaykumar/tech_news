import 'package:flutter/material.dart';

import '../backend/functions.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/utils/colors.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  static TextEditingController searchController =
      TextEditingController(text: '');

  @override
  State<Searchbar> createState() {
    return _SearchbarState();
  }
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SearchBar(
        controller: Searchbar.searchController,
        hintText: 'Search a Keyword or a Phrase',
        hintStyle:
            MaterialStateTextStyle.resolveWith((states) => GoogleFonts.lato()),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.darkGrey),
        constraints: BoxConstraints.tight(const Size.fromHeight(50)),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.only(left: 10)),
        trailing: [
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                fetchNews();
              })
        ],
      ),
    );
  }
}
