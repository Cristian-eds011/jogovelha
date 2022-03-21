import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/componentes/barra_ferramento.dart';
import 'package:jogovelha/src/home/componentes/item.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class Tabuleiro extends StatefulWidget {
  const Tabuleiro({Key? key, required this.controller}) : super(key: key);

  final ControllerTabuleiro controller;

  @override
  _TabuleiroState createState() => _TabuleiroState();
}

class _TabuleiroState extends State<Tabuleiro> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BarraFerramenta(controller: widget.controller),
        _constroiCabecalho(),
        Expanded(
          flex: 2,
          child: _constroiLinha(0),
        ),
        Expanded(
          flex: 2,
          child: _constroiLinha(1),
        ),
        Expanded(
          flex: 2,
          child: _constroiLinha(2),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }

  Widget _constroiCabecalho() {
    return !widget.controller.jogoFinalizado
        ? _constroiJogadorDaVez()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: _constroiTextoCabecalho(),
              ),
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: widget.controller.novoJogo,
                  child: const Text(
                    'Novo Jogo',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 38, 75, 93),
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  Widget _constroiLinha(int linha) {
    return Row(
      children: [
        Item(
          linha: linha,
          coluna: 0,
          controller: widget.controller,
        ),
        Item(
          linha: linha,
          coluna: 1,
          controller: widget.controller,
        ),
        Item(
          linha: linha,
          coluna: 2,
          controller: widget.controller,
        ),
      ],
    );
  }

  Widget _constroiJogadorDaVez() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        'Jogador da vez: ' + widget.controller.nomeJogadorVez(),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _constroiTextoCabecalho() {
    return widget.controller.ganhadorRodada == 'EMPATE'
        ? const Text(
            'Deu velha, EMPATOU!',
            style: TextStyle(fontSize: 20),
          )
        : Text(
            'Jogador ' + widget.controller.ganhadorRodada + ' ganhou!',
            style: const TextStyle(fontSize: 20),
          );
  }
}
