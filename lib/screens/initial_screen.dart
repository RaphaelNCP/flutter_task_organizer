import 'package:flutter/material.dart';
import 'package:flutter_task_organizer/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.task_alt_outlined),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: const Text("Tarefas"),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            children: const [
              Task(
                  "Aprender Flutter",
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                  3),
              Task(
                  "Jogar RPG",
                  "https://www.orcnroll.com/wp-content/uploads/2019/10/image-1024x693.jpeg",
                  1),
              Task(
                  "Ver Serie",
                  "https://www.tenhomaisdiscosqueamigos.com/wp-content/uploads/2023/01/cats.jpg",
                  1),
              Task(
                  "Jogar",
                  "https://t3.ftcdn.net/jpg/05/51/95/66/360_F_551956671_wQRNi3SEqgA5APbPQexv4fnOx0iTa8cE.jpg",
                  2),
              Task(
                  "Estudar",
                  "https://foconoenem.com/wp-content/uploads/2022/06/como-estudar-sozinho-para-o-Enem-.png",
                  5),
              SizedBox(height: 80,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye_outlined),
        ),
      );
  }
}
