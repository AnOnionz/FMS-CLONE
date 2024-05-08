import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/core/widgets/search_text_field.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/home/presentation/widgets/general_feature_widget.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/product/concur_product.dart';
import 'package:fms/features/order/presentation/widgets/product/order_product_info.dart';
import 'package:fms/features/order/presentation/widgets/product/select_product.dart';
import 'package:fuzzy/fuzzy.dart';

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

class _OrderPurchasePageState extends State<OrderPurchasePage>
    with AutomaticKeepAliveClientMixin {
  late final products =
      GeneralFeature.of(context).data.feature.featureOrder!.products ?? [];

  final items = <PurchaseEntity>[];
  final selectedItems = <OrderProduct>[];

  late final concurProducts = groupBy<OrderProduct, String>(
      products, (product) => product.productPackaging!.barcode!)
    ..removeWhere((key, value) => value.length < 2);

  Future<void> _scanProductBarcode() async {
    final _barcode = await context.nextRoute(OrderModule.productBarcodeScanner);

    if (_barcode == null) return;

    if (concurProducts.keys.contains(_barcode)) {
      final _product = await OverlayManager.showSheet(
          body: ConcurProduct(products: concurProducts[_barcode]!));
      if (_product != null) {
        onSelectedProduct(_product as OrderProduct);
      }
    } else {
      showFailure(
          title: 'Mã barcode không tồn tại',
          btnText: 'Quét lại',
          onPressed: () =>
              Future.delayed(300.milliseconds, () => _scanProductBarcode()));
    }
  }

  Future<void> _showSheetSelectProduct() async {
    final _product =
        await OverlayManager.showSheet(body: SelectProduct(products: products));
    if (_product != null) {
      onSelectedProduct(_product as OrderProduct);
    }
  }

  void onSelectedProduct(OrderProduct value) {
    setState(() {
      selectedItems.add(value);
      updateItems(value);
    });
  }

  void updateItems(OrderProduct value) {
    if (items.map((e) => e.featureOrderProductId).contains(value.id)) {
      final product =
          items.firstWhere((item) => item.featureOrderProductId == value.id);

      setState(() {
        product.updateQuantity(product.quantity! + 1);
      });
      Fx.log(items);
    } else {
      setState(() {
        items.add(PurchaseEntity(
            featureOrderProductId: value.id, orderProduct: value));
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Fx.log(products);
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
                      child: SearchTextField<OrderProduct>(
                    label: 'Nhập mã barcode',
                    itemBuilder: (context, value) => Material(
                      type: MaterialType.transparency,
                      child: ListTile(
                        focusColor: '#FBF6F4'.toColor(),
                        hoverColor: '#FBF6F4'.toColor(),
                        splashColor: '#FBF6F4'.toColor(),
                        selectedColor: '#FBF6F4'.toColor(),
                        selectedTileColor: '#FBF6F4'.toColor(),
                        title: Text(
                          value.product!.name!,
                          style: context.textTheme.caption1,
                        ),
                        trailing: Text(value.productPackaging!.barcode!,
                            style: context.textTheme.caption2
                                ?.copyWith(color: AppColors.nobel)),
                      ),
                    ),
                    suggestionsCallback: (search) async {
                      if (search.isEmptyOrNull) {
                        return [];
                      }

                      final fuse = Fuzzy(
                          products
                              .map((e) => e.productPackaging!.barcode)
                              .toList(),
                          options: FuzzyOptions(
                            tokenize: true,
                            threshold: 0.1,
                          ));

                      final result = fuse.search(search).map((suggest) {
                        return products.firstWhere((element) =>
                            element.productPackaging!.barcode == suggest.item);
                      }).toList();

                      return result;
                    },
                    onSelected: (value) {
                      onSelectedProduct(value);
                    },
                  )),
                  SizedBox(width: 4.w),
                  IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () async => _scanProductBarcode(),
                      icon: SvgPicture.asset(AppIcons.barcode)),
                  SizedBox(width: 0.w),
                  IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () => _showSheetSelectProduct(),
                      icon: SvgPicture.asset(AppIcons.hamburger)),
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
                          SvgPicture.asset(AppIcons.help)
                        ],
                      ),
                    ),
                    Flexible(
                      child: SelectedProduct(
                        key: UniqueKey(),
                        state: this,
                        items: items,
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
                      final total = items.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.quantity! *
                                  element.orderProduct!.price!));
                      return Text(
                        '${productPriceFormat.format(total)} VNĐ',
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
                  onNext: items.any((element) => element.quantity! > 0)
                      ? () {
                          widget.onSaveData(items);
                          widget.onNext();
                        }
                      : null,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
