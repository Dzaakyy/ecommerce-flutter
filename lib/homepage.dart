import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: const Text("Dzaky Shop"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Dzaky Shop",
        style: TextStyle(fontSize: 22,color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
