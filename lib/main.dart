// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var logo = "assets/images/logo.png";

  bool tdPressed = false;
  bool tuPressed = false;
  int _fraseAleatoria = 0;
  int likes = 0;

  var _frases = [
    '"O importante não é vencer todos os dias, mas lutar sempre."',
    '"É melhor conquistar a si mesmo do que vencer mil batalhas."',
    '"O medo de perder tira a vontade de ganhar."',
    '"Perder para a razão, sempre é ganhar."',
    '"Nem todas as tempestades vêm para atrapalhar a sua vida. Algumas vêm para limpar seu caminho."',
    '"A persistência realiza o impossível."',
    '"Não se desespere quando a caminhada estiver difícil, é sinal de que você está no caminho certo."',
    '"Seus sonhos não precisam de plateia, eles só precisam de você."',
    '"A persistência é o caminho do êxito."',
    '"As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente."',
    '"Motivação é a arte de fazer as pessoas fazerem o que você quer que elas façam porque elas o querem fazer."',
    '"Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação."',
    '"No meio da dificuldade encontra-se a oportunidade."',
    '"Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas, acima de tudo, seja você sempre."',
    '"Eu faço da dificuldade a minha motivação. A volta por cima vem na continuação."'
  ];

  void _gerarFrase() {
    setState(() {
      _fraseAleatoria = Random().nextInt(_frases.length);
      tuPressed = false;
      tdPressed = false;
    });
  }

  void _thumbUp() {
    setState(() {
      tuPressed = true;
      tdPressed = false;
      likes++;
    });
  }

  void _thumbDown() {
    setState(() {
      tdPressed = true;
      tuPressed = false;
      _frases.removeAt(_fraseAleatoria);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Frases do dia"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              logo,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            Text(
              _frases[_fraseAleatoria],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 25, 
                color: Colors.black
                ),
            ),
            Text.rich(TextSpan(
                text: "Frases curtidas: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  backgroundColor: Colors.blue[50],
                  // decoration: TextDecoration.underline
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '$likes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 147, 255),
                      ))
                ])),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: _thumbUp,
                  icon: Icon(Icons.thumb_up),
                  iconSize: 27,
                  color: (tuPressed)
                      ? Color.fromARGB(255, 9, 140, 255)
                      : Color.fromARGB(255, 0, 0, 0),
                ),
                IconButton(
                  onPressed: _gerarFrase,
                  icon: Icon(Icons.autorenew_sharp),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed:_thumbDown,
                  icon: Icon(Icons.thumb_down),
                  iconSize: 27,
                  color: (tdPressed)
                      ? Color.fromARGB(255, 248, 7, 7)
                      : Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          )),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
