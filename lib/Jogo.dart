import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagemVencedor = '';
  var _imageAPP = const AssetImage("imagens/padrao.png");

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      'PEDRA',
      'PAPEL',
      'TESOURA'
    ];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    print("Escolha do APP: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);

    switch (escolhaApp) {
      case 'PEDRA':
        setState(() {
          _imageAPP = const AssetImage("imagens/pedra.png");
        });
        break;
      case 'PAPEL':
        setState(() {
          _imageAPP = const AssetImage("imagens/papel.png");
        });
        break;
      case 'TESOURA':
        setState(() {
          _imageAPP = const AssetImage("imagens/tesoura.png");
        });
        break;
    }

    // LOGICA DO VENCEDOR
    if ((escolhaUsuario == escolhaApp)) {
      _mensagemVencedor = "Deu Empate!";
    } else if ((escolhaUsuario == 'PEDRA' && escolhaApp == 'TESOURA') || (escolhaUsuario == 'TESOURA' && escolhaApp == 'PAPEL') || (escolhaUsuario == 'PAPEL' && escolhaApp == 'PEDRA')) {
      _mensagemVencedor = "Você Venceu!";
    } else {
      _mensagemVencedor = "Você Perdeu!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokenpo"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imageAPP),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("PEDRA"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("PAPEL"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("TESOURA"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagemVencedor,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
