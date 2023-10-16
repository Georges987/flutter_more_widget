// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final _nameConttroller = TextEditingController();
  String? _sexe;
  bool? _football = false;
  bool? _music = false;
  bool? _mangas = false;
  final _formkey = GlobalKey<FormState>();
  String _name = "Auréole";
  bool _loading = false;
  bool _display = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.red),
              child: Text(
                _name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text("Messages"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("TP 2"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Mes notifications")));
              },
              icon: const Icon(Icons.add_alert)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }
}
