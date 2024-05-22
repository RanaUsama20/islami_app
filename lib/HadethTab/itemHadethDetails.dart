import 'package:flutter/material.dart';

class itemHadethDetails extends StatelessWidget {
  String content;

  itemHadethDetails({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall);
  }
}
