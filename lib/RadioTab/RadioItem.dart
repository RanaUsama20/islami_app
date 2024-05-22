import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Api/Radios.dart';

class RadioItem extends StatelessWidget{
  RadioModel radioModel;
  AudioPlayer audioPlayer;
  RadioItem({required this.radioModel, required this.audioPlayer});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
              height: 40
          ),
          Text(radioModel.name??'',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center),
          const SizedBox(
              height: 30
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IconButton(onPressed: () {
              // },
              //     icon: Icon(
              //         Icons.skip_previous_rounded,
              //     color: Theme.of(context).primaryColor,size: 50)),
              // const SizedBox(
              //     width: 20),
              IconButton(onPressed: ()async{
                await audioPlayer.play(UrlSource(radioModel.url??""));
              },
              icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Theme.of(context).primaryColor,size: 50)),
              const SizedBox(
                  width: 20),
              IconButton(onPressed: (){
                audioPlayer.stop();
              },
                  icon: Icon(
                      Icons.pause,
                  color: Theme.of(context).primaryColor,size: 50)),
            ],
          ),

        ],
      ),
    );
  }
  
}


