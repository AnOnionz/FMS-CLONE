import 'package:flutter/cupertino.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';

import '../../../../core/styles/theme.dart';
import 'review/review_customer.dart';
import 'review/review_gift.dart';
import 'review/review_product.dart';
import 'review/review_sampling.dart';

class ExchangeDetail extends StatelessWidget {
  final GeneralFeatureData generalFeature;
  final OrderEntity order;
  const ExchangeDetail(
      {super.key, required this.order, required this.generalFeature});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: kPhysics,
      slivers: [
        SliverToBoxAdapter(
          child: ReviewCustomer(
            featureCustomers: generalFeature.feature.featureCustomers ?? [],
            customerInfos: order.customerInfos,
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewProduct(
            products: generalFeature.feature.featureOrder!.products ?? [],
            purchases: order.purchases,
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewGift(
            schemes: generalFeature.feature.featureSchemes ?? [],
            exchanges: order.exchanges ?? [],
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewSampling(
            featureSamplings: generalFeature.feature.featureSamplings ?? [],
            samplings: order.samplings,
          ),
        )
      ],
    );
  }
}
