import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:islami_app/QuranTab/suraDetailsScreen.dart';
import 'package:islami_app/home%20screen.dart';
import 'package:provider/provider.dart';
import 'HadethTab/hadethDetailsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        suraDetailsScreen.routeName :(context) => const suraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => const HadethDetailsScreen(),

      },
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appMode(),




    );
  }

}