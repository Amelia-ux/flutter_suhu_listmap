import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  const Output({
    Key? key,
    required double output,
  })  : _output = output,
        super(key: key);

  final double _output;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_output",
      style: const TextStyle(fontSize: 32),
    );
  }
}
