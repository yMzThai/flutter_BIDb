import 'package:flutter/material.dart';
import 'package:flutter_imdb/api/fetch_data.dart';
import 'package:flutter_imdb/widgets/avatar_show_list.dart';


import '../modals/cast.dart';
import '../modals/overview_detial.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id, required this.backgroundColor});
  final String id;
  final Color backgroundColor;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late OverviweDetial _detail;
  late List<Cast> _casts;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loading();
  }

  Future<void> _loading() async {
    _detail = await FetchData().getDetail(widget.id);
    _casts = await FetchData().getCast(widget.id);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        title: Text(_isLoading ? "กำลังโหลด" : _detail.title!),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _Body(
              detail: _detail,
              casts: _casts,
            ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.detail, required this.casts});
  final OverviweDetial detail;
  final List<Cast> casts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _Header(urlImage: detail.imageUrl),
          AvatarShowList(casts: casts),
          _SubHeader(
            detail: detail,
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({this.urlImage});
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: urlImage != null
          ? Image.network(
              urlImage!,
              fit: BoxFit.fitHeight,
            )
          : Image.asset(
              'images/IMDb.jpg',
              fit: BoxFit.fitHeight,
            ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  const _SubHeader({required this.detail});
  final OverviweDetial detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            """
Type: ${detail.titleType}
year: ${detail.year}
rating: ${detail.rating}
genres: ${detail.genres}
author: ${detail.author}


${detail.detial}
            """,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
