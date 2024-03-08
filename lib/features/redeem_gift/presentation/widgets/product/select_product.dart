import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/widgets/button/flat.dart';
import '../../../../../core/widgets/item_container.dart';
import '../../../../../core/widgets/search_text_field.dart';

class SelectProduct extends StatelessWidget {
  const SelectProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              'Chọn sản phẩm trong danh sách',
              style: context.textTheme.h2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h),
          child: SearchTextField(),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
            child: CustomScrollView(
              shrinkWrap: true,
              physics: RangeMaintainingScrollPhysics(
                  parent: ClampingScrollPhysics()),
              slivers: [
                SliverList.builder(
                  itemCount: 18,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
                    child: ItemContainer(
                      titleFlexible: false,
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        onChanged: (value) {},
                      ),
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        FlatButton(onPressed: () {}, text: 'OK', color: AppColors.orange)
      ],
    );
  }
}
