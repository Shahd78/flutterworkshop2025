import 'main.dart';
import 'reusable.dart';
import 'resultpage.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String gender = "";
  int height = 170;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    icon: Icons.male,
                    label: "Male",
                    isSelected: gender == "Male",
                    onTap: () {
                      setState(() {
                        gender = "Male";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    icon: Icons.female,
                    label: "Female",
                    isSelected: gender == "Female",
                    onTap: () {
                      setState(() {
                        gender = "Female";
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

        
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height", style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      const Text(" cm"),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.grey,
                    onChanged: (val) {
                      setState(() {
                        height = val.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),

          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CounterCard(
                    label: "Weight",
                    value: weight,
                    onAdd: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onRemove: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CounterCard(
                    label: "Age",
                    value: age,
                    onAdd: () {
                      setState(() {
                        age++;
                      });
                    },
                    onRemove: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

       
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String result;
              if (bmi < 18.5) {
                result = "Underweight";
              } else if (bmi < 25) {
                result = "Normal";
              } else {
                result = "Overweight";
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(bmi: bmi, resultText: result),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      constraints: const BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: const CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
