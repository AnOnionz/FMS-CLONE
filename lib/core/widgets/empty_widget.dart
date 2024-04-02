import 'package:flutter/material.dart';

import '../constant/images.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.empty);
  }
}
