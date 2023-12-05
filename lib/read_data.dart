import 'package:crudrb/database_service.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  List<Map<dynamic, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();

    readData((data) {
      print("Got data: $data");
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Read Data'),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final person = _data[index];

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    person['age'].toString(),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    person['address']?.toString() ?? "User has not set address",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    person['email']?.toString() ?? "User has not set email",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12.0),
            );
          }),
    );
  }
}
