import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/isael.jpg'),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Isael Diroche',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Correo electrónico: isaeldiroche@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Teléfono: (809) 678-1819',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}