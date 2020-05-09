import 'package:flutter/material.dart';

class FishIconWidget extends StatelessWidget {
  FishIconWidget(this.fishId);

  final int fishId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        10.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorDark,
      ),
      child: Image.network(
        'http://acnhapi.com/icons/fish/$fishId',
      ),
    );
  }
}
