import 'package:critterpedia/models/fish_model.dart';
import 'package:flutter/material.dart';

class FishDetailsAvailabilityWidget extends StatelessWidget {
  FishDetailsAvailabilityWidget(
    this.fish,
    this.hemisphere,
  );

  final Fish fish;
  final String hemisphere;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(
          10.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Availability',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  (hemisphere == 'North')
                      ? Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Northern',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Southern',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  (hemisphere == 'North')
                      ? Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              '${fish.getMonthAvailableNorth}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              '${fish.getMonthAvailableSouth}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('${fish.getTimeAvailable}'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
