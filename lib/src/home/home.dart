import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/componentes/tabuleiro.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ControllerTabuleiro controllerTabuleiro = ControllerTabuleiro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jogo da Velha',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Tabuleiro(
        controller: controllerTabuleiro,
      ),
    );
  }
}
