import 'package:flutter/material.dart';

class CategoryType extends StatelessWidget {
  String name = '';
  String price = '';
  String quantity = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category type'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (text) {
                if (name == null) {
                  name = ' ';
                } else {
                  name = text;
                }
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
                if (price == null) {
                  price = ' ';
                } else {
                  price = text;
                }
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
                if (quantity == null) {
                  quantity = ' ';
                } else {
                  quantity = text;
                }
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
                if (formKey.currentState?.validate() == true) {}
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
