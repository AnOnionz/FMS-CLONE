import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class ReviewSampling extends StatefulWidget {
  final List<FeatureSampling> featureSamplings;
  final List<SamplingEntity>? samplings;
  const ReviewSampling(
      {super.key, required this.featureSamplings, required this.samplings});

  @override
  State<ReviewSampling> createState() => _ReviewSamplingState();
}

class _ReviewSamplingState extends State<ReviewSampling> {
  final Map<FeatureSampling, SamplingEntity> _items = {};
  late final int total;
  @override
  void initState() {
    widget.samplings?.forEach((sampling) {
      final item = widget.featureSamplings.firstWhereOrNull(
          (element) => element.id == sampling.featureSamplingId);
      if (item != null) {
        _items[item] = sampling;
      }
    });
    total = _items.entries.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.value.quantity ?? 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReviewContainer(
        margin: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sampling',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            for (final item in _items.entries)
              _SamplingInfoItem(
                  featureSampling: item.key, sampling: item.value),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Tổng số lượng',
                  style: context.textTheme.button2
                      ?.copyWith(color: AppColors.orange),
                )),
                Flexible(
                    child: Text(total > 0 ? 'x${total}' : '$total',
                        style: context.textTheme.subtitle1
                            ?.copyWith(color: AppColors.orange)))
              ],
            )
          ],
        ));
  }
}

class _SamplingInfoItem extends StatelessWidget {
  final FeatureSampling featureSampling;
  final SamplingEntity sampling;
  const _SamplingInfoItem(
      {required this.featureSampling, required this.sampling});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 5,
              child: Text(
                '${featureSampling.product!.name} (${featureSampling.productPackaging!.unitName})',
                style: context.textTheme.body1,
              )),
          Expanded(
              flex: 3,
              child: Text(
                featureSampling.productPackaging!.barcode ?? '',
                style: context.textTheme.body1,
              )),
          Flexible(
              child: Text(
            'x${sampling.quantity}',
            style: context.textTheme.body1,
          ))
        ],
      ),
    );
  }
}
