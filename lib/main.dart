import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_mobile/screen/edit_item_screen.dart';
import 'package:final_project_mobile/screen/login_screen.dart';
import 'package:final_project_mobile/screen/new_item_screen.dart';
import 'package:final_project_mobile/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ลาบแซ่บ แซ่บ',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'ร้านลาบ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    User? currentUser = _service.user;
    String displayEmail = "";
    if (currentUser != null && currentUser.email != null) {
      displayEmail = currentUser.email!;
    }
    return Scaffold(
      //backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        //backgroundColor: Colors.indigo[50],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'ยินดีต้อนรับ $displayEmail',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout,
                  color:
                      Colors.indigo), // use a custom icon for the logout button
              title: const Text(
                "ออกจากระบบ",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                _service.logout(currentUser);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("items").snapshots(),
        builder: ((context, snapshot) {
          final dataDocuments = snapshot.data?.docs;
          if (dataDocuments == null) return const Text("No data");
          return ListView.builder(
            itemCount: dataDocuments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataDocuments[index]["name"].toString()),
                subtitle: Text(dataDocuments[index]["desc"].toString()),
                onTap: () => _editItemScreen(dataDocuments[index].id,
                    dataDocuments[index]["name"], dataDocuments[index]["desc"]),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewItem,
        tooltip: 'สร้างรายการใหม่',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _createNewItem() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewItemScreen()));
  }

  _editItemScreen(String documentid, String itemName, String itemDesc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditItemScreen(documentid, itemName, itemDesc)));
  }
}
