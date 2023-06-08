import 'package:flutter/material.dart';

class NovaTela extends StatelessWidget {
  const NovaTela({super.key ,required this.text});

  final String text;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
        body: Center(
          child: Text(text)
          ),
        );
  }
}
