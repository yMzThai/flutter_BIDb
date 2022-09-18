

import 'package:flutter/material.dart';
import 'package:flutter_imdb/api/fetch_data.dart';
import 'package:flutter_imdb/modals/title_show.dart';
import 'package:flutter_imdb/widgets/search_bar.dart';
import 'package:flutter_imdb/widgets/setting_widget.dart';
import 'package:flutter_imdb/widgets/title_show_widget.dart';

enum Status { initial, searching, searched, noData }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Status status = Status.initial;
  List<TitleShow> titleShows = [];
  Widget _body = const _InitBackgroup();
  Color backgroundColor = Colors.green.shade200;

  Future<void> _findData(text) async {
    setState(() {
      status = Status.searching;
      _process();
    });
    titleShows = await FetchData().find(text);
    setState(() {
      status = titleShows.isEmpty ? Status.noData : Status.searched;
      _process();
    });
  }

  void _process(){
    
    switch(status){
      case Status.initial:{
        _body = const _InitBackgroup();
      }
      break;
      case Status.searching:{
        _body = const _SearchedWidget();
      }
      break;
      case Status.searched:{
        _body = _ListTitleShow(listTitleShow: titleShows,backgroundColor: backgroundColor,);
      }
      break;
      default:{
        _body = const Center(child: Text("ไม่พบข้อมูล"),);
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchBar(
                    onSubmitted: (text) {
                      _findData(text);
                    },
                  ),
                ),
                SettingWidget(callBack: (color) {
                  setState(() {
                    backgroundColor = color;
                    _process();
                  });
                  return backgroundColor;
                },backgroundColor:backgroundColor)
              ],
            ),
            Expanded(
              child: _body,
            )
          ],
        ),
      ),
    );
  }
}

class _InitBackgroup extends StatelessWidget {
  const _InitBackgroup();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('images/IMDb.jpg',fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}

class _SearchedWidget extends StatelessWidget {
  const _SearchedWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ListTitleShow extends StatelessWidget {
  const _ListTitleShow({required this.listTitleShow, required this.backgroundColor});
  final Color backgroundColor;

  final List<TitleShow> listTitleShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        cacheExtent:5000,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisExtent: 250,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemCount: listTitleShow.length,
        itemBuilder: (context, index) {
          return TitleShowWidget(
              backgroundColor: backgroundColor,
              titleShow: TitleShow(
                id: listTitleShow[index].id, 
                name: listTitleShow[index].name, 
                imageUrl: listTitleShow[index].imageUrl));
        },
      ),
    );
  }
}
