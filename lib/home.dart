import 'package:flutter/material.dart';
import 'package:simple/clothes.dart';
import 'package:simple/electronics.dart';
import 'package:simple/vehicles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All categories'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Electronics()));
              },
              child: Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                child: Text('Electronics',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Clothes()));
              },
              child: Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                child: Text('Clothes',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Vehicles()));
              },
              child: Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                child: Text('vehicles',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
