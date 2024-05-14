import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/features/order/presentation/cubit/identify_cubit.dart';
import 'package:fms/features/order/presentation/widgets/bottom_buttons.dart';
import 'package:fms/features/order/presentation/widgets/customer/Identity_form.dart';
import 'package:fms/features/order/presentation/widgets/customer/info_form.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../domain/entities/order_entity.dart';

class OrderCustomerPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  final void Function(List<CustomerInfo> customers) onSaveData;

  const OrderCustomerPage({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.onSaveData,
  });

  @override
  State<OrderCustomerPage> createState() => _OrderCustomerPageState();
}

class _OrderCustomerPageState extends State<OrderCustomerPage>
    with AutomaticKeepAliveClientMixin {
  final _identifyCubit = Modular.get<IdentifyCubit>();
  final _formKey = GlobalKey<FormState>();
  late final featureCustomers = DataFeature.of(context)
      .data
      .feature
      .featureCustomers!
      .sorted((a, b) => a.ordinal! - b.ordinal!);

  late final List<CustomerInfo> customerInfos =
      DataFeature.of(context).order.customerInfos ?? [];

  Map<FeatureCustomer, CustomerInfo> _fields = {};

  bool get validate => !_fields.entries.any((field) {
        if (field.key.isRequired!) {
          return field.value.value.isEmptyOrNull && field.value.options == null;
        }
        return false;
      });

  @override
  void didChangeDependencies() {
    if (customerInfos.length > 0) _identifyCubit.setIdentify();
    featureCustomers.forEach((featureCustomer) {
      final customerInfo = customerInfos.firstWhereOrNull(
          (element) => element.featureCustomerId == featureCustomer.id);
      _fields[featureCustomer] = customerInfo ??
          CustomerInfo(
            featureCustomerId: featureCustomer.id,
          );
    });
    setState(() {});
    super.didChangeDependencies();
  }

  void _handleCallback(List<CustomerInfo> customerInfos) {
    if (customerInfos.isNotEmpty) {
      _fields.entries.forEach((field) {
        final customerInfo = customerInfos.firstWhereOrNull((element) =>
            element.featureCustomerId == field.value.featureCustomerId);
        if (customerInfo != null) {
          _fields[field.key] = customerInfo;
        }
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            physics: kPhysics,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                  margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.sqr)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Thông tin định danh khách hàng',
                              style: context.textTheme.subtitle1,
                            ),
                            SvgPicture.asset(AppIcons.barcode)
                          ],
                        ),
                      ),
                      IdentityForm(
                        fields: _fields,
                        identifyCubit: _identifyCubit,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: BlocConsumer<IdentifyCubit, IdentifyState>(
                  bloc: _identifyCubit,
                  listener: (context, state) {
                    if (state is IdentifySuccess) {
                      _handleCallback(state.customerInfos);
                    }
                  },
                  builder: (context, state) {
                    if (state is IdentifyLoading) {
                      return Container(
                        padding: EdgeInsets.all(24.h),
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.sqr)),
                        child: AppIndicator(),
                      );
                    }
                    if (state is IdentifySuccess) {
                      return Container(
                        padding: EdgeInsets.all(24.h),
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.sqr)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Thông tin khách hàng',
                                    style: context.textTheme.subtitle1,
                                  ),
                                  Text(
                                    state.customerInfos.isNotEmpty
                                        ? 'khách cũ'
                                        : 'khách mới',
                                    style: context.textTheme.caption2?.copyWith(
                                        color: state.customerInfos.isNotEmpty
                                            ? AppColors.orange
                                            : AppColors.royalBlue),
                                  ),
                                ],
                              ),
                            ),
                            InfomationForm(
                              formKey: _formKey,
                              fields: _fields,
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              )
            ],
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
                  onBack: () {},
                  onNext: _identifyCubit.state is IdentifySuccess && validate
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            widget.onSaveData(
                                _fields.entries.map((e) => e.value).toList());
                            widget.onNext();
                          }
                        }
                      : null,
                )),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
