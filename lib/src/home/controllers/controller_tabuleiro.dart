import 'package:flutter/material.dart';

class ControllerTabuleiro extends ChangeNotifier {
  List<List<String>> matrizTabuleiro = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  String jogadorVez = 'X';
  bool jogoFinalizado = false;
  int pontosJogadorX = 0;
  int pontosJogadorO = 0;
  String ganhadorRodada = '';

  void setarJogada(int linha, int coluna) {
    if (matrizTabuleiro[linha][coluna] == '' && !jogoFinalizado) {
      matrizTabuleiro[linha][coluna] = jogadorVez;
      matrizTabuleiro[linha][coluna] = jogadorVez;
      verificarGanhador();
      if (jogadorVez == 'X') {
        jogadorVez = 'O';
      } else if (jogadorVez == 'O') {
        jogadorVez = 'X';
      }
      notifyListeners();
    }
  }

  void verificarGanhador() {
    verificarColunas();
    verificarLinhas();
    verificarDiagonais();
    if (jogoFinalizado) {
      if (jogadorVez == 'X') {
        ganhadorRodada = 'X';
        pontosJogadorX++;
      } else {
        ganhadorRodada = 'O';
        pontosJogadorO++;
      }
    }
  }

  void verificarLinhas() {
    List linha1 = matrizTabuleiro[0];
    List linha2 = matrizTabuleiro[1];
    List linha3 = matrizTabuleiro[2];

    if (linha1.every((e) => e == jogadorVez) ||
        linha2.every((e) => e == jogadorVez) ||
        linha3.every((e) => e == jogadorVez)) {
      jogoFinalizado = true;
    }
  }

  void verificarColunas() {
    bool coluna1 = matrizTabuleiro
        .map((e) => e[0])
        .every((element) => element == jogadorVez);
    bool coluna2 = matrizTabuleiro
        .map((e) => e[1])
        .every((element) => element == jogadorVez);
    bool coluna3 = matrizTabuleiro
        .map((e) => e[2])
        .every((element) => element == jogadorVez);

    if (coluna1 || coluna2 || coluna3) {
      jogoFinalizado = true;
    }
  }

  void verificarDiagonais() {
    bool diagonal1 = [
      matrizTabuleiro[0][0],
      matrizTabuleiro[1][1],
      matrizTabuleiro[2][2]
    ].every((element) => element == jogadorVez);

    bool diagonal2 = [
      matrizTabuleiro[0][2],
      matrizTabuleiro[1][1],
      matrizTabuleiro[2][0]
    ].every((element) => element == jogadorVez);

    if (diagonal1 || diagonal2) {
      jogoFinalizado = true;
    }
  }

  void zerarPontuacao(context) {
    pontosJogadorO = 0;
    pontosJogadorX = 0;
    notifyListeners();
    Navigator.pop(context);
  }

  void novoJogo() {
    zerarMatriz();
    jogoFinalizado = false;
    notifyListeners();
  }

  void zerarMatriz() {
    matrizTabuleiro = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
  }
}
