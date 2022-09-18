import 'package:flutter/material.dart';
import 'package:flutter_imdb/modals/title_show.dart';
import 'package:flutter_imdb/pages/detail_page.dart';


class TitleShowWidget extends StatelessWidget {
  const TitleShowWidget({super.key, required this.titleShow, required this.backgroundColor});
  final TitleShow titleShow;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(id: titleShow.id!, backgroundColor: backgroundColor,),));
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200
          ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 150,
              child: titleShow.imageUrl != null ? Image.network(
                titleShow.imageUrl!,
                height: 200,
                width: 150,
                fit: BoxFit.fitHeight,):Image.asset('images/IMDb.jpg',fit: BoxFit.fitHeight,),
            ),
            Center(child: Text(titleShow.name ?? "",maxLines: 2,),)
          ],
        ),
      ),
    );
  }
}