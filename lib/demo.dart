import 'package:brelax/core/constants/br_detail_data.dart';
import 'package:brelax/core/constants/colors.dart';
import 'package:brelax/core/constants/font_style.dart';
import 'package:brelax/core/widgets/br_details.dart';
import 'package:brelax/core/widgets/customized_btn.dart';
import 'package:brelax/core/widgets/gradient_scaffold.dart';
import 'package:brelax/core/widgets/timepicker.dart';
import 'package:brelax/features/breathing/presentation/pages/breathing_animation.dart';
import 'package:brelax/features/breathing/presentation/pages/breathing_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});
  @override
  State<Demo> createState() => _Demo();
}

class _Demo extends State<Demo> {
  int count = 0;

    void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) count--; // 防止數值變成負數
    });
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Center(
        child:Container(
          width: 164,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFB9B9B9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton( iconSize: 10, icon: Icon(Icons.remove),onPressed: decrement,),
            SizedBox(width: 8,),
            Text('$count',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 8,),
            IconButton( iconSize: 10, icon: Icon(Icons.add),onPressed: increment ,),
            ],
          ),
        ),
      ),
    );
    
  }
}
