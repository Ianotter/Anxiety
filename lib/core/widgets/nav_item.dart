import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool isSelected;
  final Color color;
  final double size; // 圖示大小

  const NavItem({
    super.key,
    required this.isSelected,
    required this.label,
    required this.svgPath,
    required this.color,
    this.size =30, // 預設圖示大小
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: size, // 圖示大小調整
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontFamily: 'Inter',
            fontSize: 20,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
