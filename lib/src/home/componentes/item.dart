import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/controllers/controller_tabuleiro.dart';

class Item extends StatefulWidget {
  const Item({Key? key,this.linha, this.coluna, required this.controller}) : super(key: key);

  final int? linha;
  final int? coluna;
  final ControllerTabuleiro controller;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.controller.setarJogada(widget.linha!, widget.coluna!);
        },
        child: Container(
          child: Center(
            child: Text(
              widget.controller.matrizTabuleiro[widget.linha!][widget.coluna!],
              style: const TextStyle(
                fontSize: 45,
              ),
            ),
          ),
          margin: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
