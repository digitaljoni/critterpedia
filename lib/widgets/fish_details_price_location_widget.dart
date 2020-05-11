import 'package:flutter/material.dart';

class FishDetailsPriceLocationWidget extends StatelessWidget {
  FishDetailsPriceLocationWidget({this.price, this.location});

  final int price;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Container(
              padding: EdgeInsets.all(
                10.0,
              ),
              width: double.infinity,
              child: Center(
                child: Text(
                  '$location',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Container(
              padding: EdgeInsets.all(
                10.0,
              ),
              width: double.infinity,
              child: Center(
                child: Text(
                  '$price Bells',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
