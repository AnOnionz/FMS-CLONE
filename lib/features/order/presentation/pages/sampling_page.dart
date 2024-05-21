import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/advanced_text_field.dart';
import '../../../../core/widgets/matter_container.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../widgets/bottom_buttons.dart';

class OrderSamplingPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final void Function(List<SamplingEntity> samplings) onSaveData;
  const OrderSamplingPage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderSamplingPage> createState() => _OrderSamplingPageState();
}

class _OrderSamplingPageState extends State<OrderSamplingPage>
    with AutomaticKeepAliveClientMixin {
  late final dataFeature = DataFeature.of(context);
  late final featureSamplings = dataFeature.data.feature.featureSamplings!
      .sorted((a, b) => a.ordinal! - b.ordinal!);
  late final List<SamplingEntity> _samplings =
      dataFeature.order.samplings ?? [];
  late final Map<FeatureSampling, SamplingEntity> _items = {};

  bool get validate => _items.entries.any((field) {
        return (field.value.quantity ?? 0) > 0;
      });

  @override
  void didChangeDependencies() {
    featureSamplings.forEach((featureSampling) {
      final sampling = _samplings.firstWhereOrNull(
          (element) => element.featureSamplingId == featureSampling.id);
      _items[featureSampling] = sampling ??
          SamplingEntity(
              featureSamplingId: featureSampling.id,
              product: featureSampling.product,
              productPackaging: featureSampling.productPackaging);
    });
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
              margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sqr),
                      topRight: Radius.circular(10.sqr))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(
                      'Sampling',
                      style: context.textTheme.subtitle1,
                    ),
                  ),
                  Expanded(
                      child: CustomScrollView(
                    physics: kPhysics,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        sliver: SliverList.separated(
                          itemCount: _items.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.h),
                          itemBuilder: (context, index) {
                            final samplingProduct =
                                _items.keys.elementAt(index);
                            final sampling = _items.values.elementAt(index);

                            return MatterContainer(
                                leading: MatterImage(
                                    url: samplingProduct.product!.imageUrl),
                                title: MatterInfoWidget(
                                  product: samplingProduct.product!,
                                  productPackaging:
                                      samplingProduct.productPackaging!,
                                  asset: samplingProduct.product!.brandName!,
                                ),
                                trailing: AdvancedTextField(
                                  initialValue: sampling.quantity != null
                                      ? sampling.quantity.toString()
                                      : null,
                                  unit: samplingProduct
                                      .productPackaging!.unitName!,
                                  onChanged: (value) {
                                    setState(() {
                                      _items.values.elementAt(index).quantity =
                                          int.tryParse(value) ?? 0;
                                    });
                                  },
                                ));
                          },
                        ),
                      )
                    ],
                  )),
                ],
              ),
            )),
            Container(
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    blurRadius: 25,
                    color: AppColors.black.withOpacity(0.15))
              ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: BottomButtons(
                  onBack: widget.onBack,
                  onNext: validate
                      ? () {
                          widget.onSaveData(_items.entries
                              .map((e) => e.value)
                              .where((element) =>
                                  element.quantity != null &&
                                  element.quantity! > 0)
                              .toList());
                          widget.onNext();
                        }
                      : null,
                ),
              ),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
