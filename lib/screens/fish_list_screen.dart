import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FishListScreen extends StatefulWidget {
  @override
  _FishListScreenState createState() => _FishListScreenState();
}

class _FishListScreenState extends State<FishListScreen> {
  
  Future<void> _fetchFish() async {
    final http.Response response = await http.get('http://acnhapi.com/fish/8');

    final dynamic jsonBody = json.decode(response.body);

    print (jsonBody['id']);
    print (jsonBody['name']['name-en']);
    print (jsonBody['price']);

  }

  @override
  void initState() {
    super.initState();
    _fetchFish();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
