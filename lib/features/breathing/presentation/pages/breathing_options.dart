import 'package:brelax/core/constants/br_detail_data.dart';
import 'package:brelax/core/constants/colors.dart';
import 'package:brelax/core/constants/font_style.dart';
import 'package:brelax/core/widgets/br_details.dart';
import 'package:brelax/core/widgets/customized_btn.dart';
import 'package:brelax/core/widgets/gradient_scaffold.dart';
import 'package:brelax/features/breathing/presentation/pages/breathing_animation.dart';
import 'package:brelax/features/breathing/presentation/pages/breathing_method.dart';
import 'package:brelax/features/breathing/presentation/widgets/timepicker.dart';
import 'package:flutter/material.dart';

class BreathingOptions extends StatefulWidget {
  const BreathingOptions({super.key});
  @override
  State<BreathingOptions> createState() => _BreathingOptions();
}

class _BreathingOptions extends State<BreathingOptions> {
  int selectedMinutes = 1;
  int selectedIndex = 0;
  final List<String> btnLabels = ['4-7-8', '4-2-6', '盒式呼吸', '3-3-3'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, containts){
      bool isTablet = containts.maxWidth > 600;
      return GradientScaffold(
      gradientBackground: AppColors.brBackground,
      body: Center(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:Padding(
                padding: const EdgeInsets.only(top: 20.0), 
                child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // 回上一頁
                },
                icon: const Icon(Icons.arrow_back_ios_new,size: 30,),
                color: Colors.black,
              ),
              ), 
            ),
            Column(
               mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Container(
                  width: 690,
                  height: 316,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child:  BrDetails(
                  title: breathingInfo[selectedIndex]['title'] ?? '',
                  shortID: breathingInfo[selectedIndex]['shortID'] ??'', 
                  detailed: breathingInfo[selectedIndex]['detailed'] ?? '',
                  inhale: breathingInfo[selectedIndex]['inhale'] ?? '',
                  hold: breathingInfo[selectedIndex]['hold'] ?? '',
                  exhale: breathingInfo[selectedIndex]['exhale'] ?? '',
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
              width: 690,
              height: 132,
              child: Timepicker(
              initialMinutes: selectedMinutes,
              onChanged: (newMinute){
                setState(() {
                  selectedMinutes = newMinute;
                });
              },
            ),),
            const SizedBox(height: 35),

            SizedBox(
              width: 690,
              height: 90,
              child: CustomizedBtn(
                label: '開始呼吸訓練',
                onPressed: () {
                  BreathingMethod selectedMethod =
                      BreathingMethod.breathingMethods[selectedIndex];

                  BreathingSession session = BreathingSession(
                    methodName:
                        btnLabels[selectedIndex], // 方法名稱，可以使用 btnLabels[index]
                    duration: selectedMinutes, // 使用選擇的時間
                    inhale: selectedMethod.inhale,
                    hold: selectedMethod.hold,
                    exhale: selectedMethod.exhale,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BreathingAnimation(
                              inhale: selectedMethod.inhale,
                              hold: selectedMethod.hold,
                              exhale: selectedMethod.exhale,
                              duration: selectedMinutes,
                            )),
                            );
                          },
                        ),
                      ),
                    ] 
                  ),
            SizedBox(
              width: 273,
              height: 608,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), 
                childAspectRatio: 3.0,
                crossAxisCount: 1,
                mainAxisSpacing: 82,
                children: List.generate(btnLabels.length, (index) {
                  bool isSelected = (selectedIndex == index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                        width: 273,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60)),
                          color: isSelected
                              ? const Color(0xFFFFFFFF)
                              : const Color.fromRGBO(255, 255, 255, 0.6),
                          boxShadow:[
                            BoxShadow(
                              color: isSelected? Color.fromRGBO(158, 212, 242, 1) :Colors.transparent,
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            btnLabels[index],
                            style: TextStyle(
                                color: isSelected
                                    ? const Color(0xFF2FB3FF)
                                    : const Color(0xFF989898),
                                fontSize: 24,
                                fontWeight: isSelected 
                                        ? FontWeight.w700
                                        : FontWeight.normal
                                ),
                          ),
                        )),
                  );
                }),
              ),
            ),

            
          ],
        ),
      ),
    );
      
      },
    );
  }
}
