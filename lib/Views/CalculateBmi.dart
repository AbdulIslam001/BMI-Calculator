
import 'package:flutter/material.dart';

import '../Resources/CustomSize.dart';

class CalculateBmo extends StatelessWidget {
  double result;
  String gender;
  String age;
  String height;
  String weight;
  CalculateBmo({super.key,required this.result,required this.weight,required this.height,required this.gender,required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text("Result")
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your BMI is")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: CustomSize().customHeight(context)/6,
                  width: CustomSize().customWidth(context)/3,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(CustomSize().customWidth(context)/30)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(result.toString(),style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold ,fontSize: CustomSize().customHeight(context)/30)),
                      Text("Kg/m2",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: CustomSize().customHeight(context)/50))
                    ],
                  ),
                ),
              ],
            ),
            Text("(normal)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: CustomSize().customHeight(context)/50)),
            Padding(
              padding: const EdgeInsets.only(top: 40.0,right: 30,left: 30),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12
                  ),
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.male),
                        Text(gender),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(age),
                        const Text("Age")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(height),
                        const Text("height"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(weight),
                        const Text("weight")
                      ],
                    )
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
