import 'package:flutter/material.dart';
import '../includes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? nameController;

  String name = '';

  @override
  void initState() {
    name = AppSharedPreferences.getUsername() ?? '';
    super.initState();
  }

  @override
  void dispose() async {
    await AppSharedPreferences.setUsername(name);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              onChanged: (name) {
                setState(() {
                  this.name = name;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const NextScreen()));
              }, 
              icon: const Icon(Icons.send_outlined), 
              label: const Text('Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}