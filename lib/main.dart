import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text("Tarefas"),
        ),
        body: ListView(
          children: const [
            Task("Aprender Flutter"),
            Task("Jogar RPG"),
            Task("Ver Serie"),
            Task("Ver Serie"),
            Task("Ver Serie"),
            Task("Ver Serie"),
            Task("Ver Serie"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      nome,
                      style: const TextStyle(fontSize: 24,),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
                ]),
          ),
        ],
      ),
    );
  }
}
