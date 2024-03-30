import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/styles/theme.dart';
import '../../../../../core/widgets/item_container.dart';
import '../input_quantity.dart';

class SelectedProduct extends StatelessWidget {
  final State state;
  final List<int> items;

  const SelectedProduct({super.key, required this.items, required this.state});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Image.asset(AppImages.empty);
    } else {
      return CustomScrollView(
        shrinkWrap: true,
        physics: kPhysics,
        slivers: [
          SliverList.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 22.h,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item.toString()),
                onDismissed: (direction) {
                  // ignore: invalid_use_of_protected_member
                  state.setState(() {
                    items.removeAt(index);
                  });
                },
                child: ItemContainer(
                    titleFlexible: false,
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
                          style: context.textTheme.caption2
                              ?.copyWith(color: AppColors.nobel),
                        ),
                        Text(
                          '200.000 vnd / thùng',
                          style: context.textTheme.caption2,
                        )
                      ],
                    ),
                    trailing: InputQuantity(
                      max: 100,
                    )),
              );
            },
          )
        ],
      );
    }
  }
}
