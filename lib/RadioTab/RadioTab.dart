import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/RadioTab/RadioItem.dart';
import '../Api/Radios.dart';


class RadioTab extends StatelessWidget{
  final player = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: getRadio(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var radios = snapshot.data?.radios??[];
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Image.asset('assets/images/radio_box.png'),
                  const SizedBox(
                      height: 40
                  ),
                  Text(AppLocalizations.of(context)!.holy_quran_podcast,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center),
                  Expanded(
                    child: ListView.builder(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: radios.length ,
                        itemBuilder: (context,index){
                          return RadioItem(radioModel: radios[index],audioPlayer: player,);
                        }

                        ),
                  )
                ]
            );
          }
          else if (snapshot.hasError){
            Center(
                child: Text(snapshot.error.toString()));
          }
          return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,));

        }  );
  }
  Future<Radios> getRadio() async{
    var Url = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(Url);
    if(response.statusCode == 200){
     var bodyString = response.body;
     var json = jsonDecode(bodyString);
     return Radios.fromJson(json);
    }
    else{
      throw Exception('Failed to load radios');
    }
  }
}
