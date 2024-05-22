import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'HadethTab/HadethTab.dart';
import 'QuranTab/QuranTab.dart';
import 'RadioTab/RadioTab.dart';
import 'SebhaTab/SebhaTab.dart';
import 'SettingsTab/SettingsTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget{
  static const String routeName = 'Home-Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),const HadethTab(),const RadioTab(),const SebhaTab(),const SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/dark background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover) :
        Image.asset('assets/images/light background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleMedium),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryLight ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,

              onTap: (value) {
                selectedIndex = value;
                setState(() {
                });
              },
                items:
            [
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran ,
                  icon: const ImageIcon(AssetImage('assets/images/quran_icon.png')))
              ,
              BottomNavigationBarItem(
                  label:  AppLocalizations.of(context)!.hadeth,
                  icon: const ImageIcon(AssetImage('assets/images/hadeth_icon.png'))),

              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio ,
                  icon: const ImageIcon(AssetImage('assets/images/radio_icon.png'))),

              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha ,
                  icon: const ImageIcon(AssetImage('assets/images/sebha_icon.png'))),

              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.settings ,
                  icon: const Icon(Icons.settings)),

            ]),
          ),
          body: tabs[selectedIndex],
        )
      ]
    );
  }
}