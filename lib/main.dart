import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> aList = ['Select', 'A', 'B', 'C', 'D'];
  List<String> bList = ['Select', 'b', 'c', 'd', 'e'];
  String aValue;
  String bValue;
  bool isClicked = false;
  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    aValue = aList[0];
    bValue = bList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton(
            value: aValue,
            items: aList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              print(newValue);

              setState(() {
                aValue = newValue;
                var index = aList.indexOf(newValue);
                print('Index => $index');
                bValue = bList[index];
              });
              print(aValue);
              print(bValue);
            },
          ),
          DropdownButton(
            value: bValue,
            items: bList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              print(newValue);
              setState(() {
                bValue = newValue;
              });
            },
          ),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              print(newValue);
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
