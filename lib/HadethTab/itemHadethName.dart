import 'package:flutter/material.dart';
import 'HadethTab.dart';
import 'hadethDetailsScreen.dart';


class itemHadethName extends StatelessWidget {
  Hadeth hadeth;
  itemHadethName({super.key, required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
            arguments: hadeth
        );
      },
      child: Text(
          hadeth.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
