import 'dart:convert';

import 'package:critterpedia/models/fish_model.dart';
import 'package:critterpedia/widgets/fish_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FishListScreen extends StatefulWidget {
  FishListScreen(this.hemisphere);

  final String hemisphere;

  @override
  _FishListScreenState createState() => _FishListScreenState();
}

class _FishListScreenState extends State<FishListScreen> {
  AllFish allFish;

  Future<void> _fetchAllFish() async {
    final http.Response response = await http.get('http://acnhapi.com/fish/');

    final dynamic jsonBody = json.decode(response.body);

    setState(() {
      allFish = AllFish.fromJson(jsonBody);
    });
  }

  Widget _fishListViewBuilder(BuildContext context, int index) {
    Fish fish = allFish.getList[index];

    return FishRowWidget(fish, widget.hemisphere);
  }

  @override
  void initState() {
    super.initState();
    _fetchAllFish();
  }

  @override
  Widget build(BuildContext context) {
    if (allFish != null) {
      return ListView.builder(
        itemBuilder: _fishListViewBuilder,
        itemCount: allFish.getList.length,
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
