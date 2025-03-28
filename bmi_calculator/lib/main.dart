import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      home: const BMICalculatorClass(),
    );
  }
}

class BMICalculatorClass extends StatefulWidget {
  const BMICalculatorClass({super.key});

  @override
  _BMICalculatorClass createState() => _BMICalculatorClass();
}

class _BMICalculatorClass extends State<BMICalculatorClass> {
  String weight = 'nil';
  String height = 'nil';
  String status = 'nil';
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      bmi = double.parse(weight) / (double.parse(height) * double.parse(height));
      if(bmi > 0 && bmi < 18.5) {
        status = "Underweight";
      }
      else if(bmi >= 18.5 && bmi <= 24.99) {
        status = "Normal weight";
      }
      else if(bmi >= 25 && bmi <= 29.99) {
        status = "Overweight";
      }
      else if (bmi >= 30 && bmi <= 34.99) {
        status = "Obesity (Class 1)";
      }
      else if (bmi >= 35 && bmi <= 39.99) {
        status = "Obesity (Class 2)";
      }
      else {
        status = "Obesity (Class 3)";
      }
    });
  }

  @override

  Widget build(BuildContext  context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
        style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.lightGreen,
        leading: Icon(Icons.monitor_weight),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 12.5), 
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your weight (in kg)'
                ),
                onChanged: (text) {
                  weight = text;
                },
              )),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 12.5), 
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your height (in m)'
                ),
                onChanged: (text) {
                  height = text;
                },
              )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: calculateBMI, 
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                ),
                SizedBox(
                  height: 20,
                )           ,
                Text(
                  'Your BMI is: ${bmi.toStringAsFixed(2)} \nStatus: $status',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightGreen,
                  ),
                ),
          ],
        ),
      )
    );
  }
}

