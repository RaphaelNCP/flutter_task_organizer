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
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task("Aprender Flutter"),
            Task("Jogar RPG"),
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
  const Task(this.nome,{super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            Text(nome),
            ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
          ]),
        ),
      ],
    );
  }
}
