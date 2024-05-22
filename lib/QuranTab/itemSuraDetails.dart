import 'package:flutter/material.dart';

class itemSuraDetails extends StatelessWidget{
  String content;
  int index;
  itemSuraDetails({super.key, required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
        '$content {${index+1}}',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall);
  }

}