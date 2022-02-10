import 'package:flutter/material.dart';


bottomBarItem({required Icon icon, required String label, String? tooltip}) {
    return BottomNavigationBarItem(
        icon: icon,
        label: label,
        tooltip: tooltip
    );
}
