import 'package:flutter/material.dart';

class  Timepicker extends StatefulWidget {
  final int initialMinutes;
  final ValueChanged<int> onChanged;
  
  const Timepicker({super.key,
  required this.initialMinutes,
  required this.onChanged
  });

  @override
  State<Timepicker> createState() => __TimepickerState();
}

class __TimepickerState extends State<Timepicker> {
  final FixedExtentScrollController _controller = FixedExtentScrollController(initialItem: 0);
  late int selectedMinutes; 
  final List<int> minutes = List.generate(10, (index) =>index + 1 );

  @override
  void initState() {
    super.initState();
    selectedMinutes = widget.initialMinutes; 
    _controller.jumpToItem(selectedMinutes - 1); 
  }
  

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2
                      )
                    ]
                  ),
                )),

                Align(
                alignment: Alignment.centerRight, // 右對齊
                child: Padding(
                  padding: const EdgeInsets.only(right: 230.0,bottom: 5), 
                  child: Text(
                    '分鐘',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              ListWheelScrollView.useDelegate(controller: _controller,
              itemExtent: 50,
              physics: const FixedExtentScrollPhysics(),
              overAndUnderCenterOpacity: 0.5,
              onSelectedItemChanged: (index){
                setState(() {
                    selectedMinutes = minutes[index];
                  });
                  widget.onChanged(selectedMinutes);
              },
              childDelegate: ListWheelChildBuilderDelegate(builder: (context, index) {
                bool isSelected =selectedMinutes ==minutes[index];
                return Center(
                  child: Text('${minutes[index]}',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.blue // 選中時為藍色
                              : Colors.grey
                  ),
                  )
                );
              },
              childCount: minutes.length
              ),
              ),
            ],
          ),
        );
      
    

  }
}