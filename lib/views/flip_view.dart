import 'dart:math';

import 'package:flutter/material.dart';

class FlipView extends StatefulWidget {
  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView>
    with SingleTickerProviderStateMixin {
  AnimationController animacaoController;
  Animation animacao;

  @override
  void initState() {
    super.initState();

    animacaoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animacao = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animacaoController);

    animacaoController.addListener(() {
      setState(() {});
    });

    animacaoController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
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
        title: Text("Fantasma Flip"),
      ),
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(pi * (animacao.value)),
          child: Container(
            width: 200,
            height: 200,
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          animacaoController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animacaoController.dispose();
  }
}
