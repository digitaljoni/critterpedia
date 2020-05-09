import 'package:critterpedia/screens/fish_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CritterpediaApp());

class CritterpediaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Critterpedia',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Critterpedia',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FishListScreen(),
    );
  }
}
