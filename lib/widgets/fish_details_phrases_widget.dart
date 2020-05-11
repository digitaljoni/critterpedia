import 'package:flutter/material.dart';

class FishDetailsPhrasesWidget extends StatelessWidget {
  FishDetailsPhrasesWidget({
    @required this.catchPhrases,
    @required this.museumPhrases,
  });

  final String catchPhrases;
  final String museumPhrases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(
            16.0,
          ),
          child: Text(
            '" $catchPhrases "',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black38,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 26.0,
          ),
          child: Text(
            museumPhrases,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
