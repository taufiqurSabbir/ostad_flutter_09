import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("test "),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Center(
            child: Text(
              "Responsive Design",
              style: TextStyle(
                  fontSize: screenWidth * 0.09, //9 %
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class WrapExample extends StatelessWidget {
  final List<String> categories = [
    'Fruits',
    "Vegetable",
    "Dairy",
    "Meat",
    "Fish",
    "Bakery",
    "snacks",
    "Drinks",
    "Frozen"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapExample'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
                spacing: 10,
                runSpacing: 20,
                children: categories.map((category) {
                  return Chip(
                    label: Text(category),
                    backgroundColor: Colors.blueAccent.shade100,
                  );
                }).toList()),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: List.generate(
                    100,
                    (index) => Container(
                      color: Colors.blueAccent,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" LayoutBuilder"),
      ),
      body: LayoutBuilder(
        builder: (context,con){
          if(con.maxWidth > 600){
            return Center(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                ],
              ));
          }

          else{
            return Center(
              child: Column(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenDemo(name: 'taufiq',)));
              }, child: Text('2nd screen')),
            Container(
            height: 50,
              width: 50,
              color: Colors.red,
            ),
          SizedBox(height: 10,),
          Container(
          height: 50,
          width: 50,
          color: Colors.red,
          ),
              SizedBox(height: 10,),
          Container(
          height: 50,
          width: 50,
          color: Colors.red,
          ),
              SizedBox(height: 10,),
          ],
          ));
          }
        },
      ),
    );
  }
}



class ScreenDemo extends StatelessWidget {
  final String name;
  const ScreenDemo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Text(name),

      ),
    );
  }
}

