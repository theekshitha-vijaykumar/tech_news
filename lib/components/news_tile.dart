import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tech_news/components/bottom_sheet.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/text.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.time,
      required this.url});

  final String title, imageUrl, description, time, url;

  void openNewsDetailOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black,
        elevation: 20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return NewsDetailBottomSheet(
              title: title,
              imageUrl: imageUrl,
              url: url,
              description: description);
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            openNewsDetailOverlay(context);
          },
          child: Container(
            width: width,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            color: Colors.black,
            child: Row(children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColors.primary),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(text: title, size: 16, color: Colors.white),
                    const SizedBox(height: 6),
                    ModifiedText(
                        text: time, size: 12, color: AppColors.offWhite)
                  ],
                ),
              )
            ]),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.offWhite,
            )),
      ],
    );
  }
}
