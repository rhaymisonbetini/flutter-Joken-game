import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Game> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _gameMessage = "Escolha uma opção abaixo";

  _selectedOptions(String choice) {
    List options = ["pedra", "papel", "tesoura"];
    int randomNumber = Random().nextInt(3);
    String machineChoice = options[randomNumber];
    this._setMachineChoiceImage(machineChoice);
    this._verifyResult(choice, machineChoice);
  }

  _setMachineChoiceImage(String machineChoice) {
    switch (machineChoice) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      default:
        return;
    }
  }

  _verifyResult(String choice, String machineChoice) {
    if ((choice == 'pedra' && machineChoice == 'tesoura') ||
        (choice == 'tesoura' && machineChoice == 'papel') ||
        (choice == 'papel' && machineChoice == 'pedra')) {
      setState(() {
        this._gameMessage = "Parabens! Você ganhou";
      });
    } else if ((machineChoice == 'pedra' && choice == 'tesoura') ||
        (machineChoice == 'tesoura' && choice == 'papel') ||
        (machineChoice == 'papel' && choice == 'pedra')) {
      setState(() {
        this._gameMessage = "Ops! você perdeu";
      });
    } else {
      setState(() {
        this._gameMessage = "Ops! Parece que temos um empate aqui!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenFlutter")),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(
              image: this._imagemApp,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._gameMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _selectedOptions("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 90,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectedOptions("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 90,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectedOptions("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 90,
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
