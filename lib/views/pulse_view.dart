import 'package:flutter/material.dart';

class PulseView extends StatefulWidget {
  @override
  _PulseViewState createState() => _PulseViewState();
}

class _PulseViewState extends State<PulseView>
    with SingleTickerProviderStateMixin {
  AnimationController animacaoController;
  // Tipo Size para manipular o tamanho
  Animation<Size> animacao;

  @override
  void initState() {
    super.initState();
    // Instância de AnimationController
    animacaoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    // Instância de Animation
    animacao = Tween<Size>(
      begin: Size(200, 200),
      end: Size(250, 250),
    ).animate(
      CurvedAnimation(
        parent: animacaoController,
        curve: Curves.bounceIn,
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
        title: Text("Fantasma Pulse"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animacao,
          builder: (ctx, comp) {
            return Container(
              width: animacao.value.width,
              height: animacao.value.height,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(
                    'assets/images/fantasma.png',
                  ),
                ),
              ),
            );
          },
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
