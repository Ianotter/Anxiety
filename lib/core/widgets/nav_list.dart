import 'package:brelax/core/widgets/nav_item.dart';
import 'package:flutter/material.dart';

class NavList extends StatelessWidget {
  final String selectedPage;
  final Function(String) onItemSelected;

  static const List<Map<String, dynamic>> navItems = [
    {
      'svgPath': 'assets/images/bolt.svg',
      'label': 'tES',
      'color': Color(0xFFFFCD45),
      'route': '/teshome',
    },
    {
      'svgPath': 'assets/images/breath.svg',
      'label': 'BREATHING',
      'color': Color(0xFF2FB3FF),
      'route': '/brhome',
    },
    {
      'svgPath': 'assets/images/neurology.svg',
      'label': 'NIRS',
      'color': Color(0xFFFF9898),
      'route': '/nirshome',
    },
    {
      'svgPath': 'assets/images/person.svg',
      'label': 'USER',
      'color': Color(0xFFFFA237),
      'route': '/teshome', // 還未導向 user 介面
    },
  ];

  const NavList({
    super.key,
    required this.selectedPage,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.75),
      ),
      child: Center(
        child:Padding(padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navItems.map((item) {
            final bool isSelected = selectedPage == item['label'];

            return IconButton(
              onPressed: () {
                onItemSelected(item['label']);
                Navigator.pushReplacementNamed(context, item['route']);
              },
              icon: NavItem(
                label: item['label'],
                svgPath: item['svgPath'],
                isSelected: isSelected,
                color: isSelected ? item['color'] : const Color(0xFF585858),
              ),
              iconSize: 50,
            );
          }).toList(),
        ),
        ),
      ),
    );
  }
}
