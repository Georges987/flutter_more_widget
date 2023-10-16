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
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _nameConttroller,
                          decoration: const InputDecoration(
                            labelText: "Nom et prénom *",
                            hintText: "Entrez votre nom",
                            icon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Veuillez entrer votre nom";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: null,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Mot de passe*",
                            hintText: "Définir votre mot de passe",
                            icon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Veuillez entrer votre password";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Sexe*",
                            hintText: "Sélectionner votre sexe",
                            icon: Icon(Icons.transgender),
                          ),
                          value: _sexe,
                          onChanged: (String? newValue) {
                            setState(() {
                              _sexe = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Veuillez sélectionner votre sexe";
                            }
                            return null;
                          },
                          items: <String>['Homme', 'Femme', 'Autre']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Quels sont vos passe-temps ?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _football,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _football = value;
                                        });
                                      }),
                                  const Text("Football"),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _music,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _music = value;
                                        });
                                      }),
                                  const Text("Music"),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _mangas,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _mangas = value;
                                        });
                                      }),
                                  const Text("Mangas"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Alert Dialog"),
                                    content: const Text(
                                        "Êtes-vous sûr de vouloir soumettre le formulaire ? "),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              _loading = true;
                                            });
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              setState(() {
                                                _loading = false;
                                                _display = true;
                                                _name = _nameConttroller.text;
                                              });
                                            });
                                          },
                                          child: const Text("Ok"))
                                    ],
                                  );
                                });
                          }
                        },
                        child: _loading
                            ? const CircularProgressIndicator()
                            : const Text("Valider")),
                  ],
                ),
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
