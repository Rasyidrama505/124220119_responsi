import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> amiibo;

  const DetailScreen({required this.amiibo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(amiibo['name']),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Add to favorite logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(amiibo['image']),
            SizedBox(height: 16),
            Text("Name: ${amiibo['name']}", style: TextStyle(fontSize: 20)),
            Text("Game Series: ${amiibo['gameSeries']}"),
            Text("Type: ${amiibo['type']}"),
          ],
        ),
      ),
    );
  }
}
