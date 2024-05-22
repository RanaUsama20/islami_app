import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyTheme.dart';
import '../Provider/AppConfigProvider.dart';
import 'HadethTab.dart';
import 'itemHadethDetails.dart';


class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'Hadeth Details';

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);


    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/dark background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover) :
        Image.asset('assets/images/light background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(
                args.title,
                style: Theme.of(context).textTheme.titleMedium),

          ),
          body:
          Container(

            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height*0.06,
                horizontal: MediaQuery.of(context).size.width*0.05
            ),
            decoration: BoxDecoration(
              color: provider.isDarkMode()?
              MyTheme.blackColor :
              MyTheme.whiteColor ,
              borderRadius: BorderRadius.circular(25),

            ),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return itemHadethDetails(content: args.content[index]);
                },
                itemCount: args.content.length ),
          ),

        )
      ],
    );


  }
}


