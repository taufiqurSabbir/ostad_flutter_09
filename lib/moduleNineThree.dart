import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Moduleninethree extends StatelessWidget {
  const Moduleninethree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Module 9"),
),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Image.network(
            height: 30.h,
            width: 50.w,
            fit: BoxFit.fill,
            'https://cdn3.pixelcut.app/7/20/uncrop_hero_bdf08a8ca6.jpg'),
        
            
            Image.asset('asset/logo.png'),
        
            Container(
              height: 50.h,
                width: 40.w,
              color: Colors.red,
            ),
            Text("Hello world",style: TextStyle(
              fontSize: 20.sp,
              color: Colors.blue
            ),),
          ],
        ),
      ),
    );
  }
}
