import 'package:flutter/material.dart';

class Electronics extends StatefulWidget {
  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  int count = 0;

  var formKey = GlobalKey<FormState>();

  CategoryContent content = CategoryContent('', '', '');

  List<CategoryContent> categoryList;

  @override
  Widget build(BuildContext context) {
    if (categoryList == null) {
      categoryList = [
        content,
      ];
      categoryList.length = 10;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('electronics'),
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
              Text('name: ${categoryList[index].name}',
                  style: TextStyle(fontSize: 20)),
              Text('price: ${categoryList[index].price}',
                  style: TextStyle(fontSize: 20)),
              Text('Quality: ${categoryList[index].quantity}',
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
                        categoryList[count] = content;
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

class CategoryContent {
  String _name = '';
  String _price = '';
  String _quantity = '';

  CategoryContent(this._name, this._price, this._quantity);

  String get quantity => _quantity;

  set quantity(String value) {
    _quantity = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
