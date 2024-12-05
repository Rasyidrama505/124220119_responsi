import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  // Replace this with actual favorite data from local storage
  final List<Map<String, dynamic>> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Amiibo"),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final amiibo = favorites[index];
          return Dismissible(
            key: Key(amiibo['head']),
            onDismissed: (direction) {
              // Remove from favorites logic
              favorites.removeAt(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${amiibo['name']} removed from favorites")),
              );
            },
            child: ListTile(
              leading: Image.network(amiibo['image']),
              title: Text(amiibo['name']),
              subtitle: Text(amiibo['gameSeries']),
            ),
          );
        },
      ),
    );
  }
}
