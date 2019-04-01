import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String totalBMI = "";
  String level = "";

  void _calculateBMI() {
    double part1 = 703 * double.parse(_weightController.text);
    double part2 = double.parse(_heightController.text) * double.parse(_heightController.text);

    setState(() {
      totalBMI = (part1 / part2).toStringAsFixed(1);

      if(double.parse(totalBMI) <= 18.9) {
        level = "Underweight";
      } else if(double.parse(totalBMI) > 19.0 && double.parse(totalBMI) <= 24.9) {
        level = "Healthy";
      } else if(double.parse(totalBMI) >= 25.0 && double.parse(totalBMI) <= 29.9) {
        level = "Overweight";
      } else if(double.parse(totalBMI) >= 30.0 && double.parse(totalBMI) <= 39.9) {
        level = "Obese";
      } else {
        level = "Extremely Obese";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
            "BMI",
            style: TextStyle(
              color: Colors.white,
            ),
        ),
      ),
      body: Container(
        color: Colors.white70,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Image.asset('images/bmilogo.png'),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: null,
                        decoration: InputDecoration(
                            hintText: 'Age',
                            icon: Icon(Icons.person_outline)
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: _heightController,
                        decoration: InputDecoration(
                            hintText: 'Height in Inches',
                            icon: Icon(Icons.equalizer)
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: _weightController,
                        decoration: InputDecoration(
                            hintText: 'Weight in lb',
                            icon: Icon(Icons.dehaze)
                        ),
                      ),
                    ),

                    RaisedButton(
                      color: Colors.purpleAccent,
                      onPressed: _calculateBMI,
                      child: Text(
                        "Calculate",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.6),
            ),

            Text(
              _weightController.text.isEmpty ? "Please enter a weight" : "Your BMI is $totalBMI",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500
              ),
            ),

            Text(
              _heightController.text.isEmpty ? "" : "You are $level",
              style: TextStyle(
                  color: level == "Underweight" ? Colors.blue :
                         level == "Healthy" ? Colors.green :
                         level == "Overweight" ? Colors.yellow :
                         level == "Obese" ? Colors.orange : Colors.red,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
