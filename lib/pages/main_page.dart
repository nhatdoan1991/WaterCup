import 'package:flutter/material.dart';
import 'package:water_cup/database.dart';
import 'package:water_cup/pages/watercup_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  double value = 50;
  double temp = 0;

  @override
  void initState() {
    super.initState();
    getValue();
  }

  getValue() async {
    dynamic result = await DatabaseService().getwaterLevel();
    if (result == null) {
      print("Unable to read");
    } else {
      temp = result.first()['waterlevel'];
    }
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Water Level App'),
          centerTitle: true,
        ),
        body: _buildPages(),
      );

  Widget _buildPages() {
    Future _nextPage() async {
      await getValue();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => WaterCup(value: temp)));
    }

    Future _pushToFirestore() async {
      await DatabaseService().updateWaterLevel(value);
      print("push succesfully");
    }

    return SliderTheme(
        data: SliderThemeData(
          trackHeight: 46,
          trackShape: RectangularSliderTrackShape(),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
          overlayColor: Color(0x99EB1555),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select water Level",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54),
            ),
            SizedBox(height: 20),
            Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Color.fromRGBO(162, 175, 238, 1),
              inactiveColor: Colors.black12,
              onChanged: (value) => setState(() => this.value = value),
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
              child: Text('NEXT PAGE'),
              onPressed: _nextPage,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(98, 0, 238, 0.7)),
              child: Text('PUSH TO FIRESTORE'),
              onPressed: _pushToFirestore,
            ),
          ],
        ));
  }
}
