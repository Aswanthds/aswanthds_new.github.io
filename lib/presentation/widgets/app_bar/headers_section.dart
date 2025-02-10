import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import 'custom_menu_btn.dart';
import 'horizontal_headers.dart';

class HeadersSection extends StatelessWidget {
  const HeadersSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.mediaQueryWidth > 768) {
      return const HorizontalHeaders();
    } else {
      return const CustomMenuBtn();
    }
  }
}
