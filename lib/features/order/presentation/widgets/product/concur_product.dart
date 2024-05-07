import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/images.dart';
import '../../../../../core/widgets/button/flat.dart';
import '../../../../../core/widgets/custom_checkbox.dart';
import '../../../../../core/widgets/item_container.dart';

class ConcurProduct extends StatefulWidget {
  const ConcurProduct({super.key});

  @override
  State<ConcurProduct> createState() => _ConcurProductState();
}

class _ConcurProductState extends State<ConcurProduct> {
  final Map<int, bool> _data = {};
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
              'Sản phẩm cùng mã barcode',
              style: context.textTheme.h2,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h),
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
                      trailing: CustomCheckbox(
                        value: _data[index] ?? false,
                        onChanged: (value) {
                          setState(() {
                            _data[index] = value;
                          });
                        },
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
        FlatButton(onPressed: () {}, name: 'OK', color: AppColors.orange)
      ],
    );
  }
}
