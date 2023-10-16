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
  Widget spacer = const SizedBox(height: 18);

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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Information de l'utilisateur",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Image.asset(
                  'assets/image/logo.png',
                  width: 125,
                ),
                const SizedBox(height: 20),
                Form(child: Column()),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _display ? const Card() : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Inscription",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Information",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Paramètres",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Float action button pressed"))),
          tooltip: 'Increment',
          shape: const CircleBorder(),
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add),
        ));
  }
}
