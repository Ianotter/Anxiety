import 'package:brelax/core/widgets/device_btn.dart';
import 'package:flutter/material.dart';
import 'package:brelax/core/widgets/gradient_scaffold.dart';
import 'package:brelax/core/constants/colors.dart';
import 'package:brelax/core/widgets/customized_btn.dart';

class NirsBleConnect extends StatefulWidget {
  const NirsBleConnect({super.key});

  @override
  State<NirsBleConnect> createState() => _NirsBleConnect();
}

class _NirsBleConnect extends State<NirsBleConnect> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradientBackground: AppColors.nirsBackground,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // 回上一頁
                },
                icon: const Icon(Icons.arrow_back_ios_new,size: 50,),
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset('assets/images/nirscloud.png'),
            ),

          const SizedBox(height: 30),

          const Icon(Icons.bluetooth,size: 45,),

          const SizedBox(height: 30),
          // 搜尋ble device區
          Container(
            width: 500,
            height: 234,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(255, 255, 255, 0.75),
            ),
            child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: 2,
                itemBuilder: (BuildContext context, index) {
                  return const DeviceBtn();
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
              width: 500,
              height: 50,
              child: CustomizedBtn(
                label: '下一步',
                onPressed: () {
                  Navigator.pushNamed(context, '/nirshome');
                },
              )),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

// 沒有裝置
// Center(
//     child: Text(
//   '點擊搜尋',
//   style: FontStyles.content,
// )),
