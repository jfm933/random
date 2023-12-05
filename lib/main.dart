import 'package:crudrb/database_service.dart';
import 'package:crudrb/firebase_options.dart';
import 'package:crudrb/next_page.dart';
import 'package:crudrb/read_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basic CRUD'),
      ),
      // TODO make a simple Cread Method using flutter realtime database with textfield
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Age',
            ),
            keyboardType: TextInputType.number,
            controller: ageController,
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || ageController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Name and Age cannot be empty and Age must be a valid number')),
                  );
                  return;
                }
                print(nameController.text);
                print(ageController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(
                      name: nameController.text,
                      age: ageController.text,
                    ),
                  ),
                );
              },
              child: Text('Berikutnya')),
          // ElevatedButton(
          //   onPressed: () {
          //     if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(content: Text('Name and Age cannot be empty')),
          //       );
          //       return;
          //     }
          //     try {
          //       createUser(
          //           _nameController.text, int.parse(_ageController.text));
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           content: Text(
          //         'User created successfully',
          //       )));
          //     } catch (e) {
          //       print(e);
          //     }
          //     _nameController.clear();
          //     _ageController.clear();
          //   },
          //   child: const Text('Create'),
          // ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadData()));
              },
              child: Text("Read User"))
        ],
      ),
    );
  }
}
