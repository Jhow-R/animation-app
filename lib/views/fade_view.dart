import 'package:flutter/material.dart';

class FadeView extends StatefulWidget {
  @override
  _FadeViewState createState() => _FadeViewState();
}

class _FadeViewState extends State<FadeView>
    with SingleTickerProviderStateMixin {
  AnimationController animacaoController;
  Animation animacao;

  @override
  void initState() {
    super.initState();
    // Instância de AnimationController
    animacaoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Instância de Animation
    animacao = CurvedAnimation(
      parent: animacaoController,
      curve: Curves.easeIn,
    );

    animacaoController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          print('Animação completa');
          animacaoController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animacaoController.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fantasma Fade"),
      ),
      body: Center(
        child: FadeTransition(
          opacity: animacao,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  'assets/images/fantasma.png',
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          // Iniciando a animação
          animacaoController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Encerrando a animação
    animacaoController.dispose();
  }
}
