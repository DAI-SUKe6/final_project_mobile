import 'package:final_project_mobile/services/item_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NewItemScreen extends StatefulWidget {
  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _itemName = TextEditingController();
  final _itemDesc = TextEditingController();

  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มรายการใหม่"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _itemName,
              decoration: InputDecoration(
                labelText: "ชื่อรายการ",
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
              controller: _itemDesc,
              decoration: InputDecoration(
                labelText: "รายละเอียด",
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
            ElevatedButton(onPressed: _addItem, child: const Text("บันทึก"))
          ],
        ),
      ),
    );
  }

  _addItem() {
    _itemService.addItem2Firebase(
        _itemName.text, {"name": _itemName.text, "desc": _itemDesc.text});
    Navigator.pop(context);
  }
}
