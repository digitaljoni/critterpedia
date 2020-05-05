import 'package:flutter/material.dart';

class FishDetailsTitleWidget extends StatelessWidget {
  FishDetailsTitleWidget({
    @required this.title,
    @required this.rarity,
  });

  final String title;
  final String rarity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        Text(
          rarity,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
