import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:rulers/rulers.dart';

import '../Resources/CustomSize.dart';
import 'CalculateBmi.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String height = "64";
  int age = 10;
  int weight = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: CustomSize().customHeight(context) / 15,
                left: CustomSize().customHeight(context) / 50),
            child: Row(
              children: [
                Text("BMI Calculator",
                    style: TextStyle(
                        fontSize: CustomSize().customHeight(context) / 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: CustomSize().customHeight(context) / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Gender",
                    style: TextStyle(
                        fontSize: CustomSize().customHeight(context) / 50,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: CustomSize().customHeight(context) / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: CustomSize().customHeight(context) / 6,
                  width: CustomSize().customWidth(context) / 3,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                          CustomSize().customWidth(context) / 30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.male,
                          size: CustomSize().customHeight(context) / 20),
                      Text("Male",
                          style: TextStyle(
                              fontSize:
                                  CustomSize().customHeight(context) / 50))
                    ],
                  ),
                ),
                SizedBox(width: CustomSize().customWidth(context) / 20),
                Container(
                  height: CustomSize().customHeight(context) / 6,
                  width: CustomSize().customWidth(context) / 3,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                          CustomSize().customWidth(context) / 30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.female,
                          size: CustomSize().customHeight(context) / 20),
                      Text("Male",
                          style: TextStyle(
                              fontSize:
                                  CustomSize().customHeight(context) / 50))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: CustomSize().customHeight(context) / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Height(cm)",
                    style: TextStyle(
                        fontSize: CustomSize().customHeight(context) / 50,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          int.parse(height) > 0
              ? Center(
                  child: Text(height.toString()),
                )
              : const Text(""),
          const Center(
            child: Icon(Icons.arrow_downward),
          ),
          SizedBox(
            height: 40,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 250,
                    itemBuilder: (context, index) {
                      return Badge(
                        backgroundColor: Colors.transparent,
                        textColor: Colors.black,
                        label: Text(index.toString()),
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10.0, right: 15),
                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("Age"),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              age--;
                              setState(() {});
                            },
                            child: const Icon(Icons.remove)),
                        Text(age.toString()),
                        GestureDetector(
                            onTap: () {
                              age++;
                              setState(() {});
                            },
                            child: const Icon(Icons.add))
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text("weight (kg)"),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              weight--;
                              setState(() {});
                            },
                            child: const Icon(Icons.remove)),
                        Text(weight.toString()),
                        GestureDetector(
                            onTap: () {
                              weight++;
                              setState(() {});
                            },
                            child: const Icon(Icons.add))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              double result = int.parse(weight.toString()) /
                  (64 * 0.0254) * (64 * 0.0254);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CalculateBmo(
                      result: result,
                      height: 20.toString(),
                      age: age.toString(),
                      gender: "male",
                      weight: weight.toString(),
                    );
                  },
                ),
              );
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text("Calculate BMI"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
