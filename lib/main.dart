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

const List<String> hemispheres = [
  'North',
  'South',
];

class _MainPageState extends State<MainPage> {
  String hemisphere = 'North';

  void _selectHemisphere(String selection) {
    setState(() {
      hemisphere = selection;
    });
  }

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
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(
              Icons.edit_location,
              color: Colors.white,
            ),
            onSelected: _selectHemisphere,
            itemBuilder: (BuildContext context) {
              return hemispheres.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Row(
                    children: <Widget>[
                      (option == hemisphere)
                          ? Icon(Icons.radio_button_checked)
                          : Icon(Icons.radio_button_unchecked),
                      Text(option),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: FishListScreen(hemisphere),
    );
  }
}
