import 'package:flutter/material.dart';
import 'package:flutter_imdb/widgets/avatar_show.dart';

import '../modals/cast.dart';


class AvatarShowList extends StatelessWidget {
  const AvatarShowList({super.key, required this.casts});

  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          cacheExtent: 5000,
          itemCount: casts.length,
          itemBuilder: (context, index) {
            return AvatarShow(cast: casts[index]);
          },),
      ),
    );
  }
}