import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
                  5)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
              
            });
          },
          child: Icon(Icons.remove_red_eye_outlined),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container( height: 140, decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.purple
          ),),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: Colors.white),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white,),
                        width: 90,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1) ? Colors.purpleAccent : const Color.fromARGB(100, 223, 64, 251),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2) ? Colors.purpleAccent : const Color.fromARGB(100, 223, 64, 251),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3) ? Colors.purpleAccent : const Color.fromARGB(100, 223, 64, 251),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4) ? Colors.purpleAccent : const Color.fromARGB(100, 223, 64, 251),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5) ? Colors.purpleAccent : const Color.fromARGB(100, 223, 64, 251),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                ),
                                Text(
                                  "Up",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )),
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: const Color.fromARGB(255, 77, 255, 64),
                        value: (widget.dificuldade > 0) ? (nivel/widget.dificuldade) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Nivel $nivel",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
