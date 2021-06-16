import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Container(
        child: Image.network(
            'https://i.picsum.photos/id/37/250/250.jpg?hmac=ZMIo0U9qQ6H3-jXK1khrSHzz-JeUuFQw5Hu0VO8Sdjg'),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        padding: EdgeInsets.all(100),
        margin: const EdgeInsets.all(100),
      ),
    ),
  );
}
