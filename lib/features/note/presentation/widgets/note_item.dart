import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/item_container.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/images.dart';
import 'advanced_text_field.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key});

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
        trailing: AdvancedTextField(controller: _controller));
  }
}
