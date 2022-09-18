import 'package:flutter/material.dart';
import 'package:flutter_imdb/pages/setting_page.dart';



class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, required this.callBack, required this.backgroundColor});
  final Color Function(Color) callBack;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SettingPage(callBack: (color) => callBack(color),backgroundColor: backgroundColor,),));
      },
      behavior: HitTestBehavior.opaque,
      child: const Padding(
        padding: EdgeInsets.only(top:8.0,right: 8.0,),
        child: Icon(Icons.settings),
      ),
    );
  }
}