import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/features/home/presentation/widgets/general_feature_widget.dart';
import 'package:fms/features/order/presentation/cubit/identify_cubit.dart';
import 'package:fms/features/order/presentation/widgets/bottom_buttons.dart';
import 'package:fms/features/order/presentation/widgets/customer/Identity_form.dart';
import 'package:fms/features/order/presentation/widgets/customer/info_form.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../domain/entities/order_entity.dart';

class OrderCustomerPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final void Function(List<CustomerInfo> customers) onSaveData;

  const OrderCustomerPage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderCustomerPage> createState() => _OrderCustomerPageState();
}

class _OrderCustomerPageState extends State<OrderCustomerPage>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  List<CustomerInfo> _identifyFields = [];
  List<CustomerInfo> _infoFields = [];
  final identifyCubit = Modular.get<IdentifyCubit>();

  bool validate(CustomerInfo customerInfo) {
    if (customerInfo.featureCustomer!.isRequired!) {
      return !customerInfo.value.isEmptyOrNull || customerInfo.options != null;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final generalFeature = GeneralFeature.of(context).data;
    return Column(
      children: [
        Expanded(
            child: CustomScrollView(
          physics: kPhysics,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
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
                      featureCustomers:
                          generalFeature.feature.featureCustomers!,
                      callback: (customerOrders) {
                        setState(() {
                          _identifyFields = customerOrders;
                        });
                      },
                      onIdentify: () {
                        identifyCubit.identify(
                            identifyFields: _identifyFields,
                            attendanceId:
                                generalFeature.general.attendance!.id!,
                            featureId: generalFeature.feature.id!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<IdentifyCubit, IdentifyState>(
                bloc: identifyCubit,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            featureCustomers:
                                generalFeature.feature.featureCustomers!,
                            customerInfos: state.customerInfos,
                            callback: (customerOrders) {
                              setState(() {
                                _infoFields = customerOrders;
                              });
                            },
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
            child: Builder(builder: (context) {
              final isValidate = identifyCubit.state is IdentifySuccess &&
                  _infoFields.every((element) => validate(element));
              return BottomButtons(
                onBack: () {},
                onNext: isValidate
                    ? () {
                        widget.onSaveData([..._identifyFields, ..._infoFields]);
                        widget.onNext();
                      }
                    : null,
              );
            }),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
