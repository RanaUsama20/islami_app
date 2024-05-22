import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SebhaTab extends StatefulWidget{
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int numOfTasbehs = 0;
  int index =0;
  double rotation = 0.0;
  List<String> TasbehList = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله',
    'لا حول ولا قوة الا بالله ',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30 ,
          ),
          InkWell(
                onTap: () {
                  setState(() {
                    rotation += 1;
                    onButtonClick();

                  });
                },
                child: AnimatedRotation(
                  turns: rotation,
                  duration: const Duration(seconds: 1),
                  child: SizedBox(
                    width: 232,
                    height: 234,
                    child: Image.asset(
                        'assets/images/img.png'),
                  ),
                ),
              ),
          const SizedBox(
            height: 30 ,
          ),
          Text(AppLocalizations.of(context)!.number_of_tasbehs,
              style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center),
          const SizedBox(
            height: 30 ,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(90),
              borderRadius: const BorderRadius.all(Radius.circular(25))
            ),
            child: Text( numOfTasbehs.toString(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,), ),
          ),
          const SizedBox(
            height: 30 ,
          ),
          ElevatedButton(
              onPressed: (){
                onButtonClick();
                setState(() {

                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25)

      )
      ),

              child: Text(TasbehList[index],
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,
                  color: MyTheme.whiteColor)),

          )



        ],
      ),
    );
  }

  onButtonClick(){
    numOfTasbehs++;
    if(numOfTasbehs%33 == 0) {
     index++;
     if(index >= TasbehList.length){
       index = 0;
     }
    }
  }

}