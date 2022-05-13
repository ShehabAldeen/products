import 'package:flutter/material.dart';

import 'electronics.dart';

class Clothes extends StatefulWidget {
  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  int count = 0;

  var formKey = GlobalKey<FormState>();

  CategoryContent content = CategoryContent('', '', '');

  List<CategoryContent> clothesList;

  @override
  Widget build(BuildContext context) {
    if (clothesList == null) {
      clothesList = [
        content,
      ];
      clothesList.length = 10;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
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
              Text('name: ${clothesList[index].name}',
                  style: TextStyle(fontSize: 20)),
              Text('price: ${clothesList[index].price}',
                  style: TextStyle(fontSize: 20)),
              Text('Quality: ${clothesList[index].quantity}',
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
                        clothesList[count] = content;
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
