import 'dart:convert';

import 'package:critterpedia/models/fish_model.dart';
import 'package:critterpedia/widgets/fish_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FishListScreen extends StatefulWidget {
  @override
  _FishListScreenState createState() => _FishListScreenState();
}

class _FishListScreenState extends State<FishListScreen> {
  Fish fish;

  Future<void> _fetchFish() async {
    final http.Response response = await http.get('http://acnhapi.com/fish/8');

    final dynamic jsonBody = json.decode(response.body);

    setState(() {
      fish = Fish.fromJson(jsonBody);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchFish();
  }

  @override
  Widget build(BuildContext context) {
    if (fish != null) {
      return Center(
        child: FishRowWidget(fish),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
