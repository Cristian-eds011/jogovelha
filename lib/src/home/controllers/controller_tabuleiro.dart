import 'package:flutter/material.dart';

class ControllerTabuleiro extends ChangeNotifier {
  List<List<String>> matrizTabuleiro = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  String _nomeJogador1 = 'X';
  String _nomeJogador2 = 'O';
  String _jogadorVez = 'X';
  bool jogoFinalizado = false;
  int _pontosJogador1 = 0;
  int _pontosJogador2 = 0;
  int _rodada = 0;
  String _ganhadorRodada = '';

  String get ganhadorRodada => _ganhadorRodada;

  String get jogadorVez => _jogadorVez;

  String get nomeJogador1 => _nomeJogador1;

  String get nomeJogador2 => _nomeJogador2;

  int get pontosJogador1 => _pontosJogador1;

  int get pontosJogador2 => _pontosJogador2;

  set ganhadorRodada(nomeGanhador) => _ganhadorRodada = nomeGanhador;

  set jogadorVez(proximoJogador) => _jogadorVez = proximoJogador;

  set nomeJogador1(nome) => _nomeJogador1 = nome.toString().toUpperCase();

  set nomeJogador2(nome) => _nomeJogador2 = nome.toString().toUpperCase();

  String nomeJogadorVez() {
    if (jogadorVez == 'X') {
      return _nomeJogador1;
    }
    return _nomeJogador2;
  }

  void setarNomesJogadores(String nomeJogador1param, String nomeJogador2param, context) {
    if (nomeJogador1param.isNotEmpty && nomeJogador2param.isNotEmpty) {
      nomeJogador1 = nomeJogador1param;
      nomeJogador2 = nomeJogador2param;
    }
    notifyListeners();
    Navigator.pop(context);
  }

  void setarJogada(int linha, int coluna) {
    if (matrizTabuleiro[linha][coluna].isEmpty && !jogoFinalizado) {
      matrizTabuleiro[linha][coluna] = jogadorVez;
      _rodada++;
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
        ganhadorRodada = nomeJogador1;
        _pontosJogador1++;
      } else {
        ganhadorRodada = nomeJogador2;
        _pontosJogador2++;
      }
    }
    if (_rodada == 9 && !jogoFinalizado) {
      jogoFinalizado = true;
      ganhadorRodada = 'EMPATE';
    }
  }

  void verificarLinhas() {
    bool linha1 = matrizTabuleiro[0].every((element) => element == jogadorVez);
    bool linha2 = matrizTabuleiro[1].every((element) => element == jogadorVez);
    bool linha3 = matrizTabuleiro[2].every((element) => element == jogadorVez);

    if (linha1 || linha2 || linha3) {
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
    _pontosJogador2 = 0;
    _pontosJogador1 = 0;
    notifyListeners();
    Navigator.pop(context);
  }

  void novoJogo() {
    zerarMatriz();
    jogoFinalizado = false;
    _rodada = 0;
    ganhadorRodada = '';
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
