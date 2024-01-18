// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];
  TextEditingController newDataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.0.15:3000/api/data'));
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      } else {
      
      }
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  Future<void> addData(Map<String, dynamic> newData) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.15:3000/api/addData'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newData),
      );

      if (response.statusCode == 200) {
       // print('Data added successfully');
        fetchData(); // Refresh data after adding
      } else {
      //  print('Failed to add data. Status code: ${response.statusCode}');
      //  print('Response body: ${response.body}');
      }
    } catch (e) {
    //  print('Error during network request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Express + MySQL'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: newDataController,
              decoration: const InputDecoration(labelText: 'New Data'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> newData = {
                'make': newDataController.text,
                // Add other columns and values as needed
              };
              addData(newData);
            },
            child: const Text('Add Data'),
          ),
          Expanded(
            child: ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) {
    
    return Card(
  elevation: 5,
  margin: const EdgeInsets.all(10.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Image.asset(
        'assets/${data[index]['image']}',
        height: 200,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            'Make: ${data[index]['make']}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${data[index]['image']}'),
              Text('Model: ${data[index]['make']}'),
              Text(
                'Make: ${data[index]['make']}',
                textAlign: TextAlign.justify, // Justify the text
              ), const SizedBox(height: 8), // Add some space between the description and the button
              ElevatedButton(
                onPressed: () {
                  // Handle add to favorites button tap
                  // You can add your logic here
                },
                child: const Text('Add to Favorites'),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
  },
      ),


          ),
        ],
      ),
    );
  }
}
