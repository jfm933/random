import 'package:flutter/material.dart';

import 'database_service.dart';

class NextPage extends StatefulWidget {
  final String name;
  final String age;

  const NextPage({Key? key, required this.name, required this.age})
      : super(key: key); // Modified

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Next Page"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Address',
            ),
            controller: addressController,
            keyboardType: TextInputType.multiline,
          ),
          ElevatedButton(
              onPressed: () {
                print('Nama: ${widget.name}');
                print(widget.age);
              },
              child: Text('Print age,name')),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isEmpty ||
                  addressController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Email and Address cannot be empty')),
                );
                return;
              }
              try {
                createUser(widget.name, widget.age, addressController.text,
                    emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'User created successfully',
                )));
                print(widget.name);
                print(widget.age);
                print(addressController.text);
                print(emailController.text);
              } catch (e) {
                print(e);
              }
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
