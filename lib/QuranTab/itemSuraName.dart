import 'package:flutter/material.dart';
import 'package:islami_app/QuranTab/suraDetailsScreen.dart';

class itemSuraName extends StatelessWidget{
  String suraName;
  int index;
  itemSuraName({super.key, required this.suraName, required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(suraDetailsScreen.routeName,
        arguments: suraArgs(suraName: suraName, index: index) );
      },
      child: Text(
        suraName,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }


}

class suraArgs{
  String suraName;
  int index;
  suraArgs({required this.suraName,required this.index});
}
