import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/history_exchange_module.dart';
import 'package:fms/features/order/order_module.dart';
import 'package:fms/features/order/presentation/bloc/order_bloc.dart';
import 'package:fms/features/order/presentation/pages/purchase_page.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/button/outline.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/data_feature_widget.dart';
import '../widgets/exchange_detail.dart';
import 'customer_page.dart';
import 'exchange_page.dart';
import 'order_photo_page.dart';
import 'sampling_page.dart';

class OrderPage extends StatefulWidget {
  final GeneralFeatureData entity;
  final OrderEntity? order;
  const OrderPage({super.key, required this.entity, this.order});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final NetworkTimeService _networkTimeService =
      Modular.get<NetworkTimeService>();
  final orderBloc = Modular.get<OrderBloc>();
  PageController controller = PageController();
  Completer<OrderEntity> _completer = Completer();
  late OrderEntity orderEntity;
  late List<Widget> _body = [];
  List<StepData> _steps = [];

  late StreamSubscription<OrderState>? _orderSubscription;
  bool get isEditing => widget.order != null;
  int _curr = 0;

  bool isSummary = false;

  @override
  void initState() {
    super.initState();
    _init();
    _orderSubscription = orderBloc.stream.listen((state) {
      if (state is OrderCreateLoading) {
        OverlayManager.showLoading();
      }
      if (state is OrderCreateSuccess) {
        OverlayManager.hide();
        context.nextRoute(OrderModule.success, arguments: widget.entity);
      }
      if (state is OrderUpdateSuccess) {
        OverlayManager.hide();
        context
            .nextRoute(HistoryExchangeModule.updateSuccess,
                arguments: orderEntity)
            .then((value) {
          context.pop(value);
        });
      }
      if (state is OrderUpdateFailure) {
        OverlayManager.hide();
        showFailure(
            title: 'Chỉnh sửa thất bại',
            icon: SvgPicture.asset(AppIcons.failure),
            message: state.failure.message ??
                'Phát sinh lỗi trong quá trình chỉnh sửa',
            btnText: 'Thử lại',
            onPressed: () {
              orderBloc.add(UpdateOrder(
                  order: orderEntity, feature: widget.entity.feature));
            });
      }
    });
  }

  @override
  void dispose() {
    _orderSubscription?.cancel();
    super.dispose();
  }

  void onNext() {
    if (_curr == _steps.length - 1) {
      setState(() {
        isSummary = true;
      });
    } else {
      controller.nextPage(duration: 500.milliseconds, curve: Curves.ease);
    }
  }

  void onBack() {
    controller.previousPage(duration: 500.milliseconds, curve: Curves.ease);
  }

  void onSkip(StepData step) {
    switch (step.runtimeType) {
      case CustomerStep:
        orderEntity = orderEntity.copyWith(
            customerInfos: orderEntity.customerInfos ?? []);
        break;
      case PurchaseStep:
        orderEntity =
            orderEntity.copyWith(purchases: orderEntity.purchases ?? []);
        break;
      case ExchangeStep:
        orderEntity =
            orderEntity.copyWith(exchanges: orderEntity.exchanges ?? []);
        break;
      case SamplingStep:
        orderEntity =
            orderEntity.copyWith(samplings: orderEntity.samplings ?? []);
        break;
      case PhotoStep:
        orderEntity = orderEntity.copyWith(photos: orderEntity.photos ?? []);
        break;
    }
    setState(() {});
    onNext();
  }

  bool canSkip(StepData? step) {
    switch (step.runtimeType) {
      case CustomerStep:
        return (orderEntity.customerInfos ?? []).isNotEmpty;
      case PurchaseStep:
        return (orderEntity.purchases ?? []).isNotEmpty;
      case ExchangeStep:
        return (orderEntity.exchanges ?? []).isNotEmpty;
      case SamplingStep:
        return (orderEntity.samplings ?? []).isNotEmpty;
      case PhotoStep:
        return (orderEntity.photos ?? []).isNotEmpty;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(
          onBack: isEditing
              ? () => context.pop()
              : () => showWarning(
                  title: 'Hủy đơn hàng hiện tại ?',
                  message:
                      'Đơn hàng hiện tại sẽ không được ghi nhận. Bạn có chắc muốn hủy đơn này ?',
                  icon: SvgPicture.asset(AppIcons.requestClose),
                  btnText: 'Huỷ đơn',
                  onPressed: () => context.popUntil(HomeModule.route)),
          iconBack: SvgPicture.asset(AppIcons.closeRegular),
          title: widget.entity.feature.name!,
          action: isSummary ||
                  (!widget.entity.feature.featureOrder!.isCustomerRequired! &&
                      _steps.length > 0 &&
                      _steps[_curr] is CustomerStep)
              ? null
              : TextButton(
                  onPressed: canSkip(_steps.elementAtOrNull(_curr))
                      ? () => onSkip(_steps[_curr])
                      : () => showWarning(
                          title: 'Xác nhận bỏ qua bước này',
                          message: 'Thông tin sẽ không được ghi nhận',
                          icon: SvgPicture.asset(AppIcons.requestSkip),
                          btnText: 'Bỏ qua',
                          onPressed: () {
                            onSkip(_steps[_curr]);
                          }),
                  child: Text(
                    'Skip',
                    style: context.textTheme.body1,
                  )),
        ),
        body: Builder(builder: (context) {
          if (_completer.isCompleted && !isSummary)
            return Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    margin: EdgeInsets.fromLTRB(16.w, 35.h, 16.w, 8.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.sqr)),
                    child: CustomStepper(
                      steps: _steps,
                      order: orderEntity,
                      current: _curr,
                      ignoredColor: 'FFC737'.toColor(),
                      primaryColor: '0043CE'.toColor(),
                    )),
                Expanded(
                    child: DataFeature(
                  data: widget.entity,
                  order: orderEntity,
                  child: PageView(
                    children: _body,
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    onPageChanged: (num) {
                      setState(() {
                        _curr = num;
                      });
                      Fx.log(orderEntity);
                    },
                  ),
                )),
              ],
            );
          if (_completer.isCompleted && isSummary)
            return ZoomIn(
              duration: 600.milliseconds,
              child: Padding(
                padding: EdgeInsets.only(top: 26.h),
                child: Column(
                  children: [
                    Expanded(
                        child: ExchangeDetail(
                            order: orderEntity,
                            feature: widget.entity.feature)),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, -2),
                                blurRadius: 25,
                                color: '000000'.toColor(0.15))
                          ]),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                child: OutlineButton(
                              onPressed: () {
                                setState(() {
                                  isSummary = false;
                                  controller = controller =
                                      PageController(initialPage: _curr);
                                });
                              },
                              name: 'Quay lại',
                              color: AppColors.orange,
                            )),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  if (orderEntity.id != null) {
                                    orderBloc.add(UpdateOrder(
                                        order: orderEntity,
                                        feature: widget.entity.feature));
                                  } else {
                                    orderBloc
                                        .add(CreateOrder(order: orderEntity));
                                  }
                                },
                                name: 'Hoàn thành',
                                color: AppColors.orange,
                                disableTextColor: AppColors.delRio,
                                disableColor: AppColors.potPourri,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          return SizedBox.shrink();
        }),
      ),
    );
  }

  Future<void> _init() async {
    int index = 0;
    final time = await _networkTimeService.ntpDateTime();

    if (isEditing) {
      orderEntity = widget.order!;
      orderEntity.dataTimestamp = time;
      orderEntity.attendanceId = widget.entity.general.attendance!.id;
      orderEntity.featureId = widget.entity.feature.id;
    } else {
      orderEntity = OrderEntity(
        dataUuid: Uuid().v1(),
        dataTimestamp: time,
        attendanceId: widget.entity.general.attendance!.id,
        featureId: widget.entity.feature.id,
      );
    }

    if (widget.entity.feature.featureOrder?.hasCustomer == true) {
      _steps.add(
        CustomerStep(name: 'K.Hàng', index: index++),
      );
      _body.add(OrderCustomerPage(
        key: PageStorageKey('customer'),
        onNext: onNext,
        onSaveData: (customers) {
          setState(() {
            orderEntity = orderEntity.copyWith(customerInfos: customers);
          });
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasPurchase == true) {
      _steps.add(PurchaseStep(name: 'Sản phẩm', index: index++));
      _body.add(OrderPurchasePage(
        key: PageStorageKey('product'),
        onBack: onBack,
        onNext: onNext,
        onSaveData: (purchases) {
          setState(() {
            orderEntity = orderEntity.copyWith(purchases: purchases);
          });
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasExchange == true) {
      _steps.add(ExchangeStep(
        name: 'Đổi quà',
        index: index++,
      ));
      _body.add(OrderExchangePage(
        key: PageStorageKey('exchange'),
        onBack: onBack,
        onNext: onNext,
        onSaveData: (exchanges) {
          setState(() {
            orderEntity = orderEntity.copyWith(exchanges: exchanges);
          });
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasSampling == true) {
      _steps.add(SamplingStep(name: 'Sampling', index: index++));
      _body.add(OrderSamplingPage(
        key: PageStorageKey('sampling'),
        onBack: onBack,
        onNext: onNext,
        onSaveData: (samplings) {
          setState(() {
            orderEntity = orderEntity.copyWith(samplings: samplings);
          });
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasPhoto == true) {
      _steps.add(PhotoStep(name: 'Chụp hình', index: index++));
      _body.add(OrderPhotoPage(
        key: PageStorageKey('order_photo'),
        onBack: onBack,
        onNext: onNext,
        onSaveData: (photos) {
          setState(() {
            orderEntity = orderEntity.copyWith(photos: photos);
          });
        },
      ));
    }

    setState(() {});
    _completer.complete(orderEntity);
  }
}
