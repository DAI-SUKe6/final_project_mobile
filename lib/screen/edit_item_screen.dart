import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/item_service.dart';

class EditItemScreen extends StatefulWidget {
  final String documentId;
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _itemDesc = TextEditingController();

  EditItemScreen(this.documentId, String itemName, String itemDesc) {
    _itemName.text = itemName;
    _itemDesc.text = itemDesc;
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text("แก้ไขรายาร"),
        backgroundColor: Colors.indigo[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: widget._itemName,
              decoration: InputDecoration(
                labelText: "เพิ่มชื่อ",
                labelStyle: TextStyle(color: Colors.indigo[900]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: widget._itemDesc,
              decoration: InputDecoration(
                labelText: "เพิ่มรายละเอียด",
                labelStyle: TextStyle(color: Colors.indigo[900]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteItem,
              child: Text("ลบ"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editItem,
              child: Text("บันทึก"),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo[400],
                textStyle: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _editItem() {
    final String newName = widget._itemName.text;
    final String newDesc = widget._itemDesc.text;

    if (newName.isNotEmpty && newDesc.isNotEmpty) {
      _itemService.updateItem(widget.documentId, {
        'name': newName,
        'desc': newDesc,
      }).then((value) {
        Navigator.pop(context);
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      });
    }
  }

  void _deleteItem() {
    _itemService.deleteItem(widget.documentId).then((value) {
      Navigator.pop(context);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }
}
