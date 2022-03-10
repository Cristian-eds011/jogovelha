import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/componentes/tabuleiro.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  ControllerTabuleiro controllerTabuleiro = ControllerTabuleiro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
      ),
      body: Tabuleiro(
        controller: controllerTabuleiro,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => {showInputView(context)}),
        child: const Text('Placar'),
      ),
    );
  }

  Future<Widget?> showInputView(context) {
    return showModalBottomSheet<Widget>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 163, 191, 214),
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'PLACAR GERAL',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(7),
                  child: Text(
                    'Jogador X:  ' +
                        controllerTabuleiro.pontosJogadorX.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(7),
                  child: Text(
                    'Jogador O:  ' +
                        controllerTabuleiro.pontosJogadorO.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  controllerTabuleiro.zerarPontuacao(context);
                },
                child: const Text(
                  'Resetar pontuação',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 14, 55, 75),
                  ),
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
