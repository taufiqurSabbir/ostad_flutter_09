import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  
  incrementCountrt(){
    setState(() {
      _count++; // _count = _count+1
    });


    print(_count);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(_count.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color:Colors.deepPurple),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: incrementCountrt,child: Icon(Icons.add,size: 40,),),
    );
  }
}
