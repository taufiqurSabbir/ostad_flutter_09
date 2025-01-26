import 'package:flutter/material.dart';

class ModuleNine extends StatelessWidget {
  const ModuleNine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 9"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AspectRatio
            Container(
              color: Colors.blue,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),


            Center(
              child: SizedBox(
                height: 100,
                width: 250,
                child: ColoredBox(
                  color: Colors.green,
                ),
              ),
            ),

            SizedBox(height: 20),


            // Container(
            //   height: 350,
            //   width: 250,
            //   color: Colors.blue,
            //   child: FractionallySizedBox(
            //     widthFactor: 0.8,
            //     heightFactor: 0.7,
            //     alignment: Alignment.topRight,
            //     child: Container(
            //       color: Colors.green,
            //       child: Center(child: Text("50% Width & Height")),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 300,
              width: 200,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),

                  Expanded(
                    flex: 7,
                    child: Container(
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            ),
        SizedBox(height: 10,),
          Center(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
