import 'package:flutter/material.dart';

class WaterCup extends StatelessWidget {
  final double value;
  WaterCup({required this.value});

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Water Level App'),
          centerTitle: true,
        ),
        body: _buildPages(context),
      );

  Widget _buildPages(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: 80,
          trackShape: RectangularSliderTrackShape(),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
          disabledActiveTrackColor: Color.fromRGBO(162, 175, 238, 1),
          disabledInactiveTickMarkColor: Colors.black12,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
          overlayColor: Color(0x99EB1555),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            RotatedBox(
              quarterTurns: 3,
              child: Slider(
                value: value,
                min: 0,
                max: 100,
                divisions: 100,
                inactiveColor: Colors.white70,
                onChanged: null,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value.round().toString() + "%",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(98, 0, 238, 0.7)),
              child: Text('PREVIOUS PAGE'),
              onPressed: () => {Navigator.of(context).pop()},
            ),
          ],
        ));
  }
}
