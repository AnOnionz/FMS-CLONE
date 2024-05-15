import 'package:flutter/cupertino.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../core/styles/theme.dart';
import 'review/review_customer.dart';
import 'review/review_gift.dart';
import 'review/review_product.dart';
import 'review/review_sampling.dart';

class ExchangeDetail extends StatelessWidget {
  final FeatureEntity feature;
  final OrderEntity order;
  const ExchangeDetail({super.key, required this.order, required this.feature});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: kPhysics,
      slivers: [
        SliverToBoxAdapter(
          child: ReviewCustomer(
            featureCustomers: feature.featureCustomers ?? [],
            customerInfos: order.customerInfos,
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewProduct(
            products: feature.featureOrder!.products ?? [],
            purchases: order.purchases,
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewGift(
            schemes: feature.featureSchemes ?? [],
            exchanges: order.exchanges ?? [],
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewSampling(
            featureSamplings: feature.featureSamplings ?? [],
            samplings: order.samplings,
          ),
        )
      ],
    );
  }
}
