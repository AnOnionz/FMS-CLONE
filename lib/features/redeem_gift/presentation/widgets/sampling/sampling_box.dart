import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/widgets/item_container.dart';
import '../../../../note/presentation/widgets/advanced_text_field.dart';

class SamplingBox extends StatefulWidget {
  const SamplingBox({super.key});

  @override
  State<SamplingBox> createState() => _SamplingBoxState();
}

class _SamplingBoxState extends State<SamplingBox> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ItemContainer(
        leading: Image.asset(AppImages.loginBanner),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên sản phẩm',
              style: context.textTheme.caption1,
            ),
            Text(
              'MA0001223',
              style:
                  context.textTheme.caption2?.copyWith(color: AppColors.nobel),
            ),
            Text(
              'Loại: posm',
              style:
                  context.textTheme.caption2?.copyWith(color: AppColors.nobel),
            )
          ],
        ),
        trailing: AdvancedTextField(
          controller: _controller,
          unit: 'Lon',
        ));
  }
}
