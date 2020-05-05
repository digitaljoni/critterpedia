import 'package:critterpedia/models/fish_model.dart';
import 'package:critterpedia/screens/fish_details_screen.dart';
import 'package:critterpedia/widgets/fish_icon_widget.dart';
import 'package:flutter/material.dart';

class FishRowWidget extends StatelessWidget {
  FishRowWidget(this.fish);

  final Fish fish;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return FishDetailsScreen(fish);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
            top: BorderSide(
              color: Colors.grey[300],
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            FishIconWidget(fish.id),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: 80.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${fish.name}',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      '${fish.price} Bells',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
