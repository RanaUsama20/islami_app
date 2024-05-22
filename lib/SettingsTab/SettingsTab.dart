import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsTab extends StatefulWidget{
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return  Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
          AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 15,),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appLanguage == 'en'?
                  AppLocalizations.of(context)!.english
                     :
                   AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400, color: MyTheme.blackColor
                      )),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 15,),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.isDarkMode()?
                 AppLocalizations.of(context)!.dark
                   :
                   AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,color: MyTheme.blackColor)),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => const LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder:(context) => const ThemeBottomSheet()
    );
  }
}