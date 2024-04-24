import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/crawl/presentation/cubit/crawl_cubit.dart';
import 'package:fms/features/crawl/presentation/widgets/crawl_item.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/network_time/network_time_service.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';

class CrawlPage extends StatefulWidget {
  final GeneralItemData entity;
  const CrawlPage({super.key, required this.entity});

  @override
  State<CrawlPage> createState() => _CrawlPageState();
}

class _CrawlPageState extends State<CrawlPage> {
  final networkTimeService = Modular.get<NetworkTimeService>();
  final CrawlCubit _cubit = Modular.get();

  CrawlQuantityEntity? crawlQuantityEntity = null;

  bool get isActive =>
      crawlQuantityEntity?.values.any((element) => element.value != null) ??
      false;

  Completer<bool> _completer = Completer();

  @override
  void initState() {
    super.initState();
    fetchuantities();
  }

  void fetchuantities() {
    _cubit.fetchData(
        general: widget.entity.general, feature: widget.entity.feature);
  }

  Future<void> onFetchSuccess(CrawlQuantityEntity? data) async {
    List<CrawlQuantitylValueEntity>? quantities;
    if (data != null) {
      quantities = data.values
        ..map((featureQuantity) => CrawlQuantitylValueEntity(
            featureQuantityId: featureQuantity.id)).toList();
    }
    final timestamp = await networkTimeService.ntpDateTime();
    final crawlQuantities = CrawlQuantityEntity(
        dataUuid: Uuid().v1(),
        dataTimestamp: timestamp,
        values: quantities ??
            widget.entity.feature.featureQuantities!
                .map((featureQuantity) => CrawlQuantitylValueEntity(
                    featureQuantityId: featureQuantity.id))
                .toList());
    crawlQuantityEntity = crawlQuantities;
    setState(() {});

    if (!_completer.isCompleted) _completer.complete(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: widget.entity.feature.name!,
          action: SearchButton(onPressed: () {})),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BlocConsumer<CrawlCubit, CrawlState>(
                  bloc: _cubit,
                  listener: (context, state) {
                    if (state is CrawlSuccess) {
                      onFetchSuccess(state.quantityEntity);
                    }
                  },
                  builder: (context, state) {
                    if (state is CrawlSuccess && _completer.isCompleted) {
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverPadding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              sliver: SliverList.builder(
                                itemCount: widget
                                    .entity.feature.featureQuantities!.length,
                                itemBuilder: (context, index) {
                                  final featureQuantity = widget
                                      .entity.feature.featureQuantities![index];
                                  final quantity =
                                      crawlQuantityEntity!.values[index];
                                  return CrawlItem(
                                    entity: featureQuantity,
                                    feature: widget.entity.feature,
                                    quantityValue: quantity,
                                    onChanged: (value) {
                                      setState(() {
                                        quantity.value = int.tryParse(value);
                                      });
                                    },
                                    isLast: index ==
                                        widget.entity.feature.featureQuantities!
                                                .length -
                                            1,
                                  );
                                },
                              ))
                        ],
                      );
                    }
                    if (state is CrawlFailure) {
                      return Center(
                        child: DataLoadErrorWidget(
                            onPressed: () => fetchuantities()),
                      );
                    }
                    return Center(child: AppIndicator());
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 25,
                      color: AppColors.black.withOpacity(0.15))
                ]),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: FlatButton(
                  onPressed: isActive
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          _cubit.saveData(
                              entity: crawlQuantityEntity!,
                              feature: widget.entity.feature);
                        }
                      : null,
                  name: 'Lưu',
                  color: AppColors.orange,
                  disableColor: AppColors.potPourri,
                  disableTextColor: AppColors.delRio,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
