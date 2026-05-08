import 'package:flutter/material.dart';

class Node {
  final String name;
  final double lat;
  final double lng;
  final String outfit;

  Node(this.name, this.lat, this.lng, this.outfit);
}

final List<Node> nodes = [
  Node("Bogotá", 4.711, -74.072, "🧥 Frío: Chaqueta + botas"),
  Node("Medellín", 6.244, -75.581, "👔 Templado: Casual + jeans"),
  Node("Cartagena", 10.391, -75.479, "👕 Calor: Short + camiseta"),
];

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa de Outfits 🌎"),
      ),
      body: ListView.builder(
        itemCount: nodes.length,
        itemBuilder: (context, index) {
          final node = nodes[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: Text(node.name),
              subtitle: Text(node.outfit),
              trailing: Text(
                "${node.lat}, ${node.lng}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}