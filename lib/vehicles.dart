import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'electronics.dart';

class Vehicles extends StatefulWidget {
  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  int count = 0;

  var formKey = GlobalKey<FormState>();

  CategoryContent content = CategoryContent('', '', '');

  List<CategoryContent> vhiecleList;

  @override
  Widget build(BuildContext context) {
    if (vhiecleList == null) {
      vhiecleList = [
        content,
      ];
      vhiecleList.length = 10;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('vehicles'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState(() {});
          bottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text('name: ${vhiecleList[index].name}',
                  style: TextStyle(fontSize: 20)),
              Text('price: ${vhiecleList[index].price}',
                  style: TextStyle(fontSize: 20)),
              Text('Quality: ${vhiecleList[index].quantity}',
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 15,
              )
            ],
          );
        },
        itemCount: count,
      )),
    );
  }

  void bottomSheet(BuildContext context) {
    String name;

    String price;

    String quantity;

    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Form(
            key: formKey,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (text) {
                      name = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                    ),
                    onChanged: (text) {
                      price = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                    ),
                    onChanged: (text) {
                      quantity = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter quantity';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate() == true) {
                        content = CategoryContent(name, price, quantity);
                        vhiecleList[count] = content;
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
