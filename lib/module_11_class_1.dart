import 'package:flutter/material.dart';
import 'package:hello_world/widget/cityWidget.dart';
import 'package:sizer/sizer.dart';

class Module11Class1 extends StatefulWidget {
  const Module11Class1({super.key});

  @override
  State<Module11Class1> createState() => _Module11Class1State();
}

class _Module11Class1State extends State<Module11Class1> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Are you sure you want to delete this?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog and perform delete action
                  // Add your delete action here
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Module 11"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This is snackbar"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: Text(
                "SnackBar",
                style: TextStyle(fontSize: 25),
              )),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: true,
                    context: context, builder: (context){
                 return Column(
                   children: [
                     Center(child: Text("This is Bottom Sheet")),
                     Container(
                       width: 100,
                       height: 150,
                       color: Colors.red,
                     )
                   ],
                 );
               });
              },
              child: Text(
                "Bottom Sheet",
                style: TextStyle(fontSize: 25),
              )),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (contex){
              return AlertDialog(
                title: Text("Are you sure ? "),
                content: Text("Are you sure to delete this? "),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancle")),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Okay"))
                ],
              );
            });
            
          }, child: Text("Alert Dialog")),

          SizedBox(height: 10.h,),
          Text("Top Cities",style: TextStyle(fontSize: 30),),
          SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10,),
                CityWidget(cityImage: 'https://static.toiimg.com/thumb/msid-90660347,width-748,height-499,resizemode=4,imgsize-145460/.jpg', cityName: 'Singapore', cityDescription: 'dfgr erfg  regfg rfgedrfg fgreg',),
                SizedBox(width: 5.w,),
                CityWidget(cityImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjHbz-igzXKXptbuSKfTlAWgsnKLSlxOmkHw&s', cityName: 'Nepal', cityDescription: 'dfgr erfg  regfg rfgedrfg fgreg',),
                SizedBox(width: 5.w,),
                CityWidget(cityImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQocb8Op3B50O8g3WtQTlVzWWtgYnx4b8Ysg&s', cityName: 'Thailand', cityDescription: 'dfgr erfg  regfg rfgedrfg fgreg',),
              ],
            ),
          )

        ],
      ),
    );
  }
}

