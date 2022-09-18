import 'package:flutter/material.dart';

import '../modals/cast.dart';

class AvatarShow extends StatelessWidget {
  const AvatarShow({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            minRadius: 50,
            child: ClipOval(child:cast.imageUrl != null ? 
            Image.network(cast.imageUrl!,fit: BoxFit.cover,width: 100,height: 100,): 
            Image.asset('images/IMDb.jpg',fit: BoxFit.cover,width: 100,height: 100),)
          ),const SizedBox(height: 8.0,),
          Text("${cast.name}"),
          if(cast.characters != null) Text("(${cast.characters})")
        ],),
    );
  }
}