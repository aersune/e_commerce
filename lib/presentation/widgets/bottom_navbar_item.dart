import 'package:e_commerce/common/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatefulWidget {
  final ValueSetter<int> setIndex;

  const BottomNavbarWidget({
    super.key,
    required this.setIndex,
  });

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  var activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navbarItem("assets/icons/home.png", 0, "Home"),
          _navbarItem("assets/icons/browse.png", 1, "Browse"),
          _navbarItem("assets/icons/favs.png", 2, "Favorites"),
          _navbarItem("assets/icons/cart.png", 3, "Cart"),
          _navbarItem("assets/icons/profile.png", 4, "Profile"),
        ],
      ),
    );
  }

  Widget _navbarItem(String asset, int index, String text) {
    var isActive = activeIndex == index;
    return InkWell(
        onTap: () {
          setState(() {
            activeIndex = index;
          });
          widget.setIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageIcon(
                AssetImage(asset),
                size: 30,
                color: isActive ? AppColors.blackColor : AppColors.titleColor.withValues(alpha: .4),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: TextStyle(color: isActive ? AppColors.blackColor : AppColors.blackColor.withValues(alpha: .4),fontWeight: FontWeight.w500 ),
              )
            ],
          ),
        ));
  }
}
