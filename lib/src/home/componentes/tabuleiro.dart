import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/componentes/item.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class Tabuleiro extends StatefulWidget {
  Tabuleiro({required this.controller}) : super();

  late ControllerTabuleiro controller;

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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
      ),
    );
  }

  Widget _constroiCabecalho() {
    return !widget.controller.jogoFinalizado
        ? Container(
            child: Text(
              'Jogador da vez: ' + widget.controller.jogadorVez,
              style: const TextStyle(fontSize: 20),
            ),
          )
        : Column(
            children: [
              Container(
                margin:const EdgeInsets.all(5),
                child: Text(
                  'JOGADOR ' + widget.controller.ganhadorRodada + ' GANHOU!',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: widget.controller.novoJogo,
                child: const Text('Novo Jogo',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 38, 75, 93),
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
}
