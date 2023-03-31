import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/item_service.dart';

class EditItemScreen extends StatefulWidget {
  late String documentid;
  final _itemName = TextEditingController();
  final _itemDesc = TextEditingController();
  EditItemScreen(String documentid, String itemname, String itemdesc) {
    documentid = documentid;
    _itemName.text = itemname;
    _itemDesc.text = itemdesc;
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แก้ไขรายาร"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _deleteItem,
              child: const Text("ลบ"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            ElevatedButton(
              onPressed: _editItem,
              child: const Text("บันทึก"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _editItem() {}

  void _deleteItem() {}
}
