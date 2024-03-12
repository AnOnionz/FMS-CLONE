import 'package:flutter/cupertino.dart';

import 'review/review_customer.dart';
import 'review/review_gift.dart';
import 'review/review_product.dart';
import 'review/review_sampling.dart';

class ExchangeDetail extends StatelessWidget {
  const ExchangeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: RangeMaintainingScrollPhysics(parent: ClampingScrollPhysics()),
      slivers: [
        SliverToBoxAdapter(
          child: ReviewCustomer(),
        ),
        SliverToBoxAdapter(
          child: ReviewProduct(),
        ),
        SliverToBoxAdapter(
          child: ReviewGift(),
        ),
        SliverToBoxAdapter(
          child: ReviewSampling(),
        )
      ],
    );
  }
}
