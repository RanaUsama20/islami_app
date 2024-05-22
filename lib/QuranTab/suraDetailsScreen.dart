import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:islami_app/QuranTab/itemSuraDetails.dart';
import 'package:islami_app/QuranTab/itemSuraName.dart';
import 'package:provider/provider.dart';

class suraDetailsScreen extends StatefulWidget{
  static const String routeName = 'Sura-Details';

  const suraDetailsScreen({super.key});

  @override
  State<suraDetailsScreen> createState() => _suraDetailsScreenState();
}

class _suraDetailsScreenState extends State<suraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as suraArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if(verses.isEmpty){
    loadFiles(args.index);
    }
    // TODO: implement build
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/dark background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover) :
        Image.asset('assets/images/light background.png',
        width: double.infinity,
        height: double.infinity,),
        Scaffold(
          appBar: AppBar(
            title: Text(args.suraName,
            style: Theme.of(context).textTheme.titleMedium,),
          ),
          body:  verses.isEmpty? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,)) :
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.1,
              vertical: MediaQuery.of(context).size.height*0.09

            ),
            decoration: BoxDecoration(
              color: provider.isDarkMode()?
                  MyTheme.blackColor :
              MyTheme.whiteColor ,
              borderRadius: BorderRadius.circular(25),


            ),
            child: ListView.separated(
              separatorBuilder: (context, index){
                return Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 1,
                );
              },
                itemCount: verses.length,
                itemBuilder: (context,index){
                  return itemSuraDetails(content: verses[index], index: index);
                }),
          ) ,
        )
      ],
    );
  }

  void loadFiles(int index)async {
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
     lines.removeLast() ;
    setState(() {
     verses =  lines;
    });
  }
}