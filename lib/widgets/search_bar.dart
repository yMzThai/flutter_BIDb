import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({super.key,required this.onSubmitted});

  final void Function(String text) onSubmitted;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
      });
     });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200
        ),
        child: Row(
          children: [
            const _SearchBarIcon(
              icon: Icons.search,),
            Expanded(
              child: TextField(
                controller: _controller,
                textInputAction:TextInputAction.search,
                onSubmitted: widget.onSubmitted,
                decoration:const InputDecoration(
                  hintText:"ค้นหารายชื่อหนัง",
                  border: InputBorder.none
                )
              )),
            if(_controller.text.isNotEmpty )_SearchBarIcon(
              icon: Icons.close,
              onTap: () {
                _controller.clear();
              },),
          ],
        ),
      ),
    );
  }
}

class _SearchBarIcon extends StatelessWidget {
  const _SearchBarIcon({
    required this.icon, 
    this.onTap
    });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
    );
  }
}