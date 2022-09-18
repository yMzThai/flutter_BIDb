

import 'package:flutter/material.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.callBack, required this.backgroundColor});
  final Color Function(Color) callBack;
  final Color backgroundColor;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = widget.backgroundColor;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Setting")),
        body:  _Body(
          currentBackgroup: backgroundColor,
          onChange: (color) {
            setState(() {
              backgroundColor = color;
            });
            return widget.callBack(color);
          } ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.currentBackgroup, required this.onChange});
  final Color currentBackgroup;
  final Color Function(Color) onChange;
  


  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late List<_OptionTile> _optionTiles;

  static final Map<String,Color> _colors ={
    "สีขาว":Colors.white,
    "สีดำ":Colors.grey.shade700,
    "สีเขียว": Colors.green.shade200,
    "สีแดง": Colors.red.shade200,
    "สีฟ้า": Colors.blue.shade200,
    "สีเหลือง": Colors.yellow.shade200
  };

  List<_OptionTile> _getOptionTiles(){
    final List<_OptionTile> list = _colors.entries.map((e) => _OptionTile(
      name: e.key, 
      isSeleted: e.value==widget.currentBackgroup,
      color: e.value,
      onTap: (color) {
        return widget.onChange(color);
      },)).toList();
    
    return list;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _optionTiles = _getOptionTiles();
    });
  }

  @override
  void didUpdateWidget(covariant _Body oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.currentBackgroup != widget.currentBackgroup){
      setState(() {
      _optionTiles = _getOptionTiles();
    });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Backgroup Color",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(height:20.0),
              ..._optionTiles
            ],
          ),
        ),
      ),
    );
  }
}


class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.name, required this.isSeleted, required this.color, required this.onTap});

  final String name;
  final bool isSeleted;
  final Color color;
  final Color Function(Color) onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(color);
      },
      child: Container(
        width: double.infinity,
        color: isSeleted ?Colors.grey.shade300:null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 18.0
            ),),
        ),
      ),
    );
  }
}
