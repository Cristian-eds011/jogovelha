import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class BarraFerramenta extends StatelessWidget {
  BarraFerramenta({Key? key, required this.controller}) : super(key: key);

  final ControllerTabuleiro controller;

  final TextEditingController controllerJogador1 = TextEditingController();

  final TextEditingController controllerJogador2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _constroiCabecalhoBarraFerramenta(
                context, 'Placar', showModalPlacar),
          ),
          Expanded(
            child: _constroiCabecalhoBarraFerramenta(
                context, 'Jogadores', showModalJogadores),
          )
        ],
      ),
    );
  }

  Future<Widget?> showModalPlacar(context) {
    return showModalBottomSheet<Widget>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: Column(children: [
            _constroiCabecalhoModal('Placar Geral', context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _constroiPontosJogadores(
                    controller.nomeJogador1, controller.pontosJogador1),
                _constroiPontosJogadores(
                    controller.nomeJogador2, controller.pontosJogador2),
              ],
            ),
            TextButton(
              onPressed: () {
                controller.zerarPontuacao(context);
              },
              child: const Text(
                'Resetar pontuação',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  Future<Widget?> showModalJogadores(BuildContext context) {
    return showModalBottomSheet<Widget>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: Column(
              children: [
                _constroiCabecalhoModal('Nome Jogadores', context),
                _constroiInputNomeJogadores('1', controllerJogador1),
                _constroiInputNomeJogadores('2', controllerJogador2),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    onPressed: () => controller.setarNomesJogadores(controllerJogador1.text, controllerJogador2.text,context),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Container _constroiPontosJogadores(nomeJogador, pontosJogador) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7),
      child: Text(
        nomeJogador + ':  ' + pontosJogador.toString(),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Row _constroiInputNomeJogadores(
      String jogador, TextEditingController controller) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          child: Text('Jogador ' + jogador + ' :'),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: (_) => {},
            decoration: InputDecoration(
                hintText: 'Digite o nome do Jogador ' + jogador + ' :'),
          ),
        ),
      ],
    );
  }

  Container _constroiCabecalhoBarraFerramenta(
      context, String textoTitulo, funcaoModal) {
    return Container(
      margin: const EdgeInsets.all(2),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Center(
        child: TextButton(
          onPressed: () => funcaoModal(context),
          child: Text(
            textoTitulo,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Container _constroiCabecalhoModal(String texto, context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                texto,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
