import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/button/flat.dart';
import '../widgets/customer/info_form.dart';

class RedeemGiftCustomerPage extends StatefulWidget {
  final VoidCallback onNext;
  const RedeemGiftCustomerPage({super.key, required this.onNext});

  @override
  State<RedeemGiftCustomerPage> createState() => _RedeemGiftCustomerPageState();
}

class _RedeemGiftCustomerPageState extends State<RedeemGiftCustomerPage>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _invoiceCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: CustomScrollView(
          physics: kPhysics,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                            'Thông tin mua hàng',
                            style: context.textTheme.subtitle1,
                          ),
                          SvgPicture.asset(AppIcons.barcode)
                        ],
                      ),
                    ),
                    InfomationForm(
                      formKey: _formKey,
                      customerNameController: _customerNameController,
                      phoneNumberController: _phoneNumberController,
                      invoiceCodeController: _invoiceCodeController,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(24.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.sqr)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Chụp hình hóa đơn',
                      style: context.textTheme.subtitle1,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 20.h),
                    //   child: ImagePickerWidget(
                    //     max: 5,
                    //     images: _imageInvoice,
                    //   ),
                    // ),
                    Text(
                      'Chụp hình đổi quà',
                      style: context.textTheme.subtitle1,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 20.h),
                    //   child: ImagePickerWidget(
                    //     max: 5,
                    //     images: _imageExchange,
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        )

            //     Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            //       margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            //       decoration: BoxDecoration(
            //           color: AppColors.white,
            //           borderRadius: BorderRadius.circular(10.sqr)),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(bottom: 20.h),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   'Thông tin mua hàng',
            //                   style: context.textTheme.subtitle1,
            //                 ),
            //                 SvgPicture.asset(AppIcons.barcode)
            //               ],
            //             ),
            //           ),
            //           InfomationForm(
            //             formKey: _formKey,
            //             customerNameController: _customerNameController,
            //             phoneNumberController: _phoneNumberController,
            //             invoiceCodeController: _invoiceCodeController,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Flexible(
            //       child: Container(
            //         padding: EdgeInsets.all(24.h),
            //         margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            //         decoration: BoxDecoration(
            //             color: AppColors.white,
            //             borderRadius: BorderRadius.circular(10.sqr)),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Text(
            //               'Chụp hình hóa đơn',
            //               style: context.textTheme.subtitle1,
            //             ),
            //             Padding(
            //               padding: EdgeInsets.symmetric(vertical: 20.h),
            //               child: TakeImage(
            //                 limit: 5,
            //                 images: [],
            //               ),
            //             ),
            //             Text(
            //               'Chụp hình đổi quà',
            //               style: context.textTheme.subtitle1,
            //             ),
            //             Padding(
            //               padding: EdgeInsets.only(top: 20.h),
            //               child: TakeImage(
            //                 limit: 5,
            //                 images: [],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // )
            ),
        Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 25,
                color: AppColors.black.withOpacity(0.15))
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onNext();
                }
              },
              name: 'Tiếp tục',
              color: AppColors.orange,
              disableTextColor: AppColors.delRio,
              disableColor: AppColors.potPourri,
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
