import 'package:flutter/material.dart';

class SlideView extends StatefulWidget {
  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  AnimationController animacaoController;
  // Tipo Offset para manipular o tamanho
  Animation<Offset> animacao;

  @override
  void initState() {
    super.initState();
    // Instância de AnimationController
    animacaoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    // Instância de Animation
    animacao = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: animacaoController,
        curve: Curves.linear,
      ),
    );

    animacaoController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          animacaoController.repeat();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fantasma Slide"),
      ),
      body: Center(
        child: SlideTransition(
          position: animacao,
          child: Container(
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
