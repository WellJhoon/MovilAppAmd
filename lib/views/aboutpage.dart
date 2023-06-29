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
              backgroundImage: AssetImage('lib/assets/yo.jpg'),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text(
              'jhon',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Correo electrónico: jhon437699@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Teléfono: (829) 396-4502',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
