import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ostad Flutter app',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _numberController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          children: [
            Text(
              "Ostad Flutter 2",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.amberAccent,
                  hintText: "Enter your Number",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                  hintMaxLines: 3,
                  labelText: "Number",
                  labelStyle: TextStyle(fontSize: 25, color: Colors.blue),
                  helperText: "Please enter your Number",
                  helperStyle: TextStyle(fontSize: 15, color: Colors.green),
                  helperMaxLines: 1,
                  // prefixText: "Email: ",
                  // suffixText: "@gmail.com",
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.send),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
        
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.amberAccent,
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                  hintMaxLines: 3,
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 25, color: Colors.blue),
                  helperText: "Please enter your email",
                  helperStyle: TextStyle(fontSize: 15, color: Colors.green),
                  helperMaxLines: 1,
                  // prefixText: "Email: ",
                  // suffixText: "@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.send),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
        
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.amberAccent,
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                  hintMaxLines: 3,
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 25, color: Colors.blue),
                  helperText: "Please enter your Password",
                  helperStyle: TextStyle(fontSize: 15, color: Colors.green),
                  helperMaxLines: 1,
                  // prefixText: "Email: ",
                  // suffixText: "@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.send),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
        
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ),
            ),
        
            ElevatedButton(
                onPressed: () {
                  _passwordController.text.length > 6
                      ? print("Password is strong")
                      : print("Password is weak");
                  print(_numberController.text);
                  print('${_emailController.text}@gmail.com');
                  print(_passwordController.text);
                },
                child: Text('Submit')),
        
            ElevatedButton(
                onPressed: () {
                  _numberController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: Text("Clear")),


        SizedBox(
          height: 250,
          width: 250,
          child:  ListView.builder(
            itemCount: 15,
            itemBuilder: (contex,index){
              return  ListTile(
                title: Text("Taufiqur Rahman ${index}"),
                subtitle: Text("Software Engineer"),
                leading: Icon(Icons.account_circle,size: 50,),
                trailing: Icon(Icons.send),
                onTap: (){
                  print("I'm ListTile");
                },
                onLongPress: (){
                  print("I'm ListTile long press");
                },
              );
            },

          ),
        ),
        
            Text("This is text 1",
                style: TextStyle(fontSize: 25, color: Colors.amber)),
            Divider(),
            Text("This is text 1",
                style: TextStyle(fontSize: 25, color: Colors.amber)),
        
            ListTile(
              title: Text("Taufiqur Rahman"),
              subtitle: Text("Software Engineer"),
              leading: Icon(
                Icons.account_circle,
                size: 50,
              ),
              trailing: Icon(Icons.send),
              onTap: () {
                print("I'm ListTile");
              },
              onLongPress: () {
                print("I'm ListTile long press");
              },
            ),
        
            SizedBox(
              height: 50,
              width: 10,
              child: Text(
                "This is a text",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
            ),
        
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Click me",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  )),
            ),
        
        


        
            ///Flutter old class
            // Center(
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.green,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //       ),
            //       onPressed: (){
            //     print("This is a button");
            //   }, child:
            //
            //       Text("Send",style: TextStyle(color: Colors.white,fontSize: 25),),
            //
            //
            //   ),
            // ),
            // Icon(Icons.add_a_photo,size: 50,color: Colors.red,),
            // TextButton(onPressed: (){
            //   print("I'm text button");
            // }, child: Text("Click me",style: TextStyle(color: Colors.blue,fontSize: 25),)),
            // IconButton(onPressed: (){
            //   print("I'm icon button");
            // }, icon: Icon(Icons.add_a_photo,size: 50,color: Colors.red,)),
            //
            //
            // InkWell(
            //   onTap: (){
            //     print("I'm inkwell");
            //   },
            //   onHover: (value){
            //     print("I'm inkwell hover");
            //   },
            //   onLongPress: (){
            //     print("I'm inkwell long press");
            //   },
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     margin: EdgeInsets.only(top: 50),
            //    alignment: Alignment.center,
            //     decoration:BoxDecoration(
            //       color: Colors.deepPurpleAccent,
            //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            //       border: Border.all(color: Colors.black,width: 5),
            //       gradient: LinearGradient(colors: [Colors.yellow.shade300,Colors.orange.withOpacity(0.5),Colors.red,Colors.black],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       ),
            //       boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey,
            //             blurRadius: 10,
            //             spreadRadius: 5,
            //             offset: Offset(5,5)
            //           )
            //       ]
            //     ) ,
            //     child: Text("This is a container",style: TextStyle(color: Colors.blue,fontSize: 25),) ,
            //   ),
            // ),
            //
            // GestureDetector(
            //   onTap: (){
            //     print("I'm GestureDetector");
            //   },
            //   onDoubleTap: (){
            //     print("I'm GestureDetector double tap");
            //   },
            //
            //   onLongPress: (){
            //     print("I'm GestureDetector long press");
            //   },
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     margin: EdgeInsets.only(top: 50),
            //     alignment: Alignment.center,
            //     decoration:BoxDecoration(
            //         color: Colors.deepPurpleAccent,
            //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            //         border: Border.all(color: Colors.black,width: 5),
            //         gradient: LinearGradient(colors: [Colors.green.shade300,Colors.orange.withOpacity(0.5),Colors.black],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey,
            //               blurRadius: 10,
            //               spreadRadius: 10,
            //               offset: Offset(0,5)
            //           )
            //         ]
            //     ) ,
            //     child: Text("This is a container",style: TextStyle(color: Colors.blue,fontSize: 25),) ,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
