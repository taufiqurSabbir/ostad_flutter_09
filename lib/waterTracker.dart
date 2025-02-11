import 'package:flutter/material.dart';
import 'package:hello_world/widget/addWaterBtn.dart';

class Watertracker extends StatefulWidget {
  const Watertracker({super.key});

  @override
  State<Watertracker> createState() => _WatertrackerState();
}

class _WatertrackerState extends State<Watertracker> {
  int _currentintake = 0;
  final int _goal = 2000;




  void _waterAdd(int amount){
    setState(() {
      if(_currentintake <_goal){
        _currentintake = (_currentintake+amount).clamp(0, _goal);
      }
    });
  }

  void resetWater(){
    setState(() {
      _currentintake = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    double progress = (_currentintake / _goal).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
          title: Text(
            'Water Tracker',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Column(
                children: [
                  Text(
                    "Today's InTake",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${_currentintake} ml",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress, // 0 - 1 1= 100 0.5 = 50%
                    backgroundColor: Colors.grey.shade500,
                    color: Colors.blueAccent,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()} %',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Wrap(
              spacing: 15,
              children: [
                addWaterBtn(amount: 200,icon: Icons.local_drink,onClick: () => _waterAdd(200),),
                addWaterBtn(amount: 500,onClick: () => _waterAdd(500),),
                addWaterBtn(amount: 1000,icon: Icons.local_cafe,onClick: () => _waterAdd(1000),),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                    onPressed: ()=>resetWater() ,
                    child: Text(
                      'Reset',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
