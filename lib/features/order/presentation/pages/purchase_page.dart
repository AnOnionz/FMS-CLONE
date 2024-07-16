import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/format.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';
import 'package:fms/features/order/presentation/widgets/product/concur_product.dart';
import 'package:fms/features/order/presentation/widgets/product/select_product.dart';

import '../../order_module.dart';
import '../widgets/bottom_buttons.dart';
import '../widgets/product/selected_product.dart';

class OrderPurchasePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final void Function(List<PurchaseEntity> purchases) onSaveData;

  const OrderPurchasePage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderPurchasePage> createState() => _OrderPurchasePageState();
}

class _OrderPurchasePageState extends State<OrderPurchasePage> {
  late final products =
      DataFeature.of(context).data.feature.featureOrder?.products ?? [];

  late final purchases =
      DataFeature.of(context).order.purchases ?? <PurchaseEntity>[];
  final selectedItems = <OrderProduct, PurchaseEntity>{};

  late final concurProducts = groupBy<OrderProduct, String>(
      products, (product) => product.productPackaging!.barcode!)
    ..removeWhere((key, value) => value.length < 2);

  Future<void> _scanProductBarcode() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String? _barcode = null;
    _barcode = await context.nextRoute(OrderModule.productBarcodeScanner);

    if (_barcode.isEmptyOrNull) return;

    if (concurProducts.keys.contains(_barcode)) {
      final _product = await OverlayManager.showSheet(
          body: ConcurProduct(products: concurProducts[_barcode]!));
      if (_product != null) {
        onSelectedProduct(_product as OrderProduct);
      }
    } else {
      final _product = products.firstWhereOrNull(
          (element) => element.productPackaging!.barcode == _barcode);

      if (_product != null) {
        onSelectedProduct(_product);
      } else {
        showFailure(
            title: 'Mã barcode không tồn tại',
            message: 'Không tìm thấy mã barcode trong hệ thống',
            btnText: 'Quét lại',
            onPressed: () =>
                Future.delayed(300.milliseconds, () => _scanProductBarcode()));
      }
    }
  }

  Future<void> _showSheetSelectProduct() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final _product =
        await OverlayManager.showSheet(body: SelectProduct(products: products));
    if (_product != null) {
      onSelectedProduct(_product as OrderProduct);
    }
  }

  void onSelectedProduct(OrderProduct value) {
    if (selectedItems.containsKey(value)) {
      final purchase = selectedItems[value]!;
      purchase.updateQuantity(purchase.quantity! + 1);
    } else {
      selectedItems[value] = PurchaseEntity(
          featureOrderProductId: value.id,
          product: value.product,
          productPackaging: value.productPackaging,
          quantity: 1);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    purchases.forEach((purchase) {
      final product = products.firstWhereOrNull(
          (element) => element.id == purchase.featureOrderProductId);
      if (product != null) {
        selectedItems[product] = PurchaseEntity(
            featureOrderProductId: purchase.featureOrderProductId,
            product: product.product ?? purchase.product,
            productPackaging:
                product.productPackaging ?? purchase.productPackaging,
            quantity: purchase.quantity);
      }
    });
    setState(() {});
    super.didChangeDependencies();
  }

  // bool get validate => selectedItems.entries.any((item) {
  //       return item.value.quantity! > 0;
  //     });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24.h, 24.h, 16.h, 24.h),
              margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.sqr)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: TextField(
                    cursorHeight: 19.2.sp,
                    cursorWidth: 0.9,
                    canRequestFocus: false,
                    onTap: () => _showSheetSelectProduct(),
                    textAlignVertical: TextAlignVertical.center,
                    style: context.textTheme.body1,
                    maxLength: 48,
                    buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) =>
                        null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: 'Tìm sản phẩm',
                        hintStyle: context.textTheme.body1,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 28.w),
                        suffixIconConstraints: BoxConstraints(),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: SvgPicture.asset(
                            AppIcons.search1,
                            colorFilter: ColorFilter.mode(
                                AppColors.black, BlendMode.srcIn),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.sqr),
                            borderSide: BorderSide(color: '#EA9567'.toColor())),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.sqr),
                            borderSide:
                                BorderSide(color: '#EA9567'.toColor()))),
                  )

                      //      SearchTextField<OrderProduct>(
                      //   label: 'Nhập mã barcode',
                      //   itemBuilder: (context, value) => Material(
                      //     type: MaterialType.transparency,
                      //     child: ListTile(
                      //       focusColor: '#FBF6F4'.toColor(),
                      //       hoverColor: '#FBF6F4'.toColor(),
                      //       splashColor: '#FBF6F4'.toColor(),
                      //       selectedColor: '#FBF6F4'.toColor(),
                      //       selectedTileColor: '#FBF6F4'.toColor(),
                      //       title: Text(
                      //         value.product!.name!,
                      //         style: context.textTheme.caption1,
                      //       ),
                      //       trailing: Text(value.productPackaging!.barcode!,
                      //           style: context.textTheme.caption2
                      //               ?.copyWith(color: AppColors.nobel)),
                      //     ),
                      //   ),
                      //   suggestionsCallback: (search) async {
                      //     if (search.isEmptyOrNull) {
                      //       return [];
                      //     }

                      //     final fuse = Fuzzy(
                      //         products
                      //             .map((e) => e.productPackaging!.barcode)
                      //             .toSet()
                      //             .toList(),
                      //         options: FuzzyOptions(
                      //           tokenize: true,
                      //           threshold: 0.1,
                      //         ));

                      //     final result = <OrderProduct>[];
                      //     fuse.search(search).forEach((suggest) {
                      //       final sameAsBarcodeProducts = products.where(
                      //           (element) =>
                      //               element.productPackaging!.barcode ==
                      //               suggest.item);
                      //       result.addAll(sameAsBarcodeProducts);
                      //     });

                      //     return result;
                      //   },
                      //   onSelected: (value) {
                      //     onSelectedProduct(value);
                      //   },
                      // )
                      ),
                  SizedBox(width: 4.w),
                  IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () async => _scanProductBarcode(),
                      icon: SvgPicture.asset(AppIcons.barcode)),
                  // SizedBox(width: 0.w),
                  // IconButton(
                  //     style: IconButton.styleFrom(
                  //         tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  //     onPressed: () => _showSheetSelectProduct(),
                  //     icon: SvgPicture.asset(AppIcons.hamburger)),
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(24.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.sqr)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sản phẩm khách đã mua',
                            style: context.textTheme.subtitle1,
                          ),
                          // SvgPicture.asset(AppIcons.help)
                        ],
                      ),
                    ),
                    Flexible(
                      child: SelectedProduct(
                        key: UniqueKey(),
                        items: selectedItems,
                        onChanged: () {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
        Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 25,
                color: AppColors.black.withOpacity(0.15))
          ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.dimGray),
                    ),
                    Builder(builder: (context) {
                      final total = selectedItems.entries.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.value.quantity! * element.key.price!));
                      return Text(
                        '${kNumberFormater.formatString(total.toString())} VNĐ',
                        style: context.textTheme.button1
                            ?.copyWith(color: AppColors.nero),
                      );
                    })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: BottomButtons(
                  onBack: widget.onBack,
                  onNext: () {
                    widget.onSaveData(selectedItems.entries
                        .map((e) => e.value)
                        .where((element) =>
                            element.quantity != null && element.quantity! > 0)
                        .toList());
                    widget.onNext();
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
