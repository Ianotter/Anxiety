import 'package:brelax/core/constants/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrDetails extends StatelessWidget {
  final String title;
  final String shortID;
  final String detailed;
  final String inhale;
  final String hold;
  final String exhale;

  const BrDetails({
    super.key,
    this.title = '',
    this.shortID = '',
    this.detailed = '',
    this.inhale = '',
    this.exhale = '',
    this.hold = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xC4FFFFFF),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 41),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          
          Container(
            width: 607,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFFCDEDFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              shortID,
              textAlign: TextAlign.center,
              style:TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),
            ),
          ),
          
          Text(
            detailed,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Breathstep(textin: inhale, texth: hold,textex: exhale, ),
            ],
          )
        ],
      ),
    );
  }
}

class Breathstep extends StatelessWidget {
  final String textin;
  final String texth;
  final String textex;


  const Breathstep({super.key, required this.textin,required this.texth, required this.textex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 607,
      height: 50,
      decoration: BoxDecoration(color: const Color(0xFFCDEDFF),borderRadius: BorderRadius.circular(10)),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 子元素水平從左到右排列
  crossAxisAlignment: CrossAxisAlignment.center, // 子元素在垂直方向居中對齊
      children: [
        SvgPicture.asset('assets/images/breath.svg', width: 25, height: 25, fit: BoxFit.contain),
        
        Text(
          textin,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
           textAlign: TextAlign.center,
        ),

        SvgPicture.asset('assets/images/arrow.svg', width: 30, height: 30, fit: BoxFit.contain),//箭頭

        SvgPicture.asset('assets/images/hold.svg', width: 25, height: 25, fit: BoxFit.contain),
        
        Text(
          texth,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
           textAlign: TextAlign.center,
        ),

        SvgPicture.asset('assets/images/arrow.svg', width: 30, height: 30, fit: BoxFit.contain),//箭頭

        SvgPicture.asset('assets/images/breath.svg', width: 25, height: 25, fit: BoxFit.contain),
        
        Text(
          textex,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
           textAlign: TextAlign.center,
        ),
      ],
    ),
    );
  }
}
