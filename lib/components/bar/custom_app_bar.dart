// lib/components/custom_app_bar.dart

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;

  CustomAppBar({
    this.title,
    this.height = 56.0, // Standart AppBar yüksekliği
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != null) // title metni varsa göster
            SizedBox(width: 10), // Logo ve metin arasına boşluk ekle
          if (title != null)
            Text(
              title!,
              style: TextStyle(color: Colors.white),
            ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.amber,
      elevation: 0.0, // AppBar yüksekliğini sıfırla
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
