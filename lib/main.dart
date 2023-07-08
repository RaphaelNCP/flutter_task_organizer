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
          leading: const Icon(Icons.task_alt_outlined),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: const Text("Tarefas"),
        ),
        body: ListView(
          children: const [
            Task("Aprender Flutter",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large"),
            Task("Jogar RPG",
                "https://www.orcnroll.com/wp-content/uploads/2019/10/image-1024x693.jpeg"),
            Task("Ver Serie",
                "https://www.tenhomaisdiscosqueamigos.com/wp-content/uploads/2023/01/cats.jpg"),
            Task("Jogar",
                "https://t3.ftcdn.net/jpg/05/51/95/66/360_F_551956671_wQRNi3SEqgA5APbPQexv4fnOx0iTa8cE.jpg"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;

  const Task(this.nome, this.foto, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Stack(
        children: [
          Container(color: Colors.purple, height: 140),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.white,
                        width: 100,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
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
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.star, size: 15, color: Colors.purpleAccent,),
                                Icon(Icons.star, size: 15, color: Colors.purpleAccent,),
                                Icon(Icons.star, size: 15, color: Colors.purpleAccent,),
                                Icon(Icons.star, size: 15, color: Color.fromARGB(100, 223, 64, 251),),
                                Icon(Icons.star, size: 15, color: Color.fromARGB(100, 223, 64, 251),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
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
                        ),
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
                        value: nivel / 10,
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
