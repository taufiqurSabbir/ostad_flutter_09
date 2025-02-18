import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
class Module12Class3 extends StatefulWidget {
  const Module12Class3({super.key});

  @override
  State<Module12Class3> createState() => _Module12Class3State();
}

class _Module12Class3State extends State<Module12Class3> {
  List users = [];
  bool isloading = false;

  Future<void> fatchUsers() async{
    setState(() {
      isloading = true;
    });
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() {
      isloading = false;
    });
    if(response.statusCode == 200){
      users = jsonDecode(response.body);
    }else{
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
      ),

      body: isloading ?_buildShimmerEffect() :  ListView.builder(
          itemCount: users.length,
          itemBuilder: (contex,index){
            final user = users[index];
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text(user['name'][0],style: TextStyle(color: Colors.white),),
                ),
                title: Text(user['name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text('UserName : ${user['username']}',style: TextStyle(color: Colors.grey),),
                    Text('Email : ${user['email']}',style: TextStyle(color: Colors.grey),),
                    Text('Phone : ${user['phone']}',style: TextStyle(color: Colors.grey),),
                    Text('Website : ${user['website']}',style: TextStyle(color: Colors.grey),),
                    Text('Address : ${user['address']['street']} ,  ${user['address']['city']}',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            );
          }),
    );
  }
}


// Function to build shimmer effect while loading
Widget _buildShimmerEffect() {
  return ListView.builder(
    itemCount: 10,  // Show 10 items as placeholders
    itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          leading: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 30,
            ),
          ),
          title: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 150,
              color: Colors.white,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 200,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 250,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 220,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
