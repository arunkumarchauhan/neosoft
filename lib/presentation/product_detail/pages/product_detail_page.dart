import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_state.dart';
import 'package:neostore/presentation/product_detail/model/product.dart';
import 'package:neostore/presentation/product_detail/widgets/product_detail_card_widget.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/presentation/shared/appbar/build_appbar_with_title_back_and_search_button.dart';
import 'package:neostore/presentation/shared/buttons/grey_background_dark_grey_text_elevated_button.dart';
import 'package:neostore/presentation/shared/buttons/red_background_white_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGreyColor,
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (BuildContext context, ProductDetailState state) {
        if (state is ProductDetailLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductDetailFetchSuccessState) {
          final product = state.product;
          return Scaffold(
            backgroundColor: kLightGreyColor,
            appBar: buildAppbarWithTitleBackAndSearchButton(
              context: context,
              title: product.name,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: kProductDetailTitleTextStyle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Category - ${context.read<ProductListingBloc>().productCategory}",
                          overflow: TextOverflow.ellipsis,
                          style: kProductDetailSubTitle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.producer,
                                overflow: TextOverflow.ellipsis,
                                style: kProductDetailSubTitle
                                  ..copyWith(fontSize: 10),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int rate = 1; rate <= 5; rate++)
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: rate <= product.rating
                                        ? kStarGlowingColor
                                        : kStarDimColor,
                                  )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 40.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.h),
                    // width: 600.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailCardWidget(
                          product: product,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Text(
                          "Description",
                          style: kProductDetailDescriptionTitleTextStyle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          product.description,
                          style: productDetailDescriptionBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    color: Colors.white,
                    height: 250.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: RedBackgroundWhiteTextElevatedButton(
                              text: "BUY NOW",
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                        reverse: true,
                                        child: _buildAlertItems(product,
                                            _buildBuyNowSpecificWidget()),
                                      ),
                                    );
                                  },
                                );
                              }),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Flexible(
                            child: GreyBackgroundDarkGreyTextElevatedButton(
                          text: "RATE",
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: _buildAlertItems(
                                      product, _rateNowSpecificWidget(product)),
                                );
                              },
                            );
                          },
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
            child: Text(
          "Something went wrong",
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.red,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ));
      }),
    );
  }

  Widget _rateNowSpecificWidget(Product product) {
    int _selectedRate = 3;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int rate = 1; rate <= 5; rate++)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedRate = rate;
                        });
                      },
                      icon: Icon(
                        Icons.star,
                        size: 40,
                        color: rate <= _selectedRate
                            ? kStarGlowingColor
                            : kStarDimColor,
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              SizedBox(
                  height: 250.h,
                  width: 700.w,
                  child: RedBackgroundWhiteTextElevatedButton(
                      text: "RATE NOW", onPressed: () {}))
            ]);
      },
    );
  }

  Widget _buildBuyNowSpecificWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Enter Qty",
          style: TextStyle(
              color: k2c2b2bColor,
              fontWeight: FontWeight.w100,
              fontSize: 20,
              fontFamily: "Gotham"),
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
          width: 350.w,
          height: 180.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          child: Material(
              child: Form(
            key: _formKey,
            child: BaseTextFormField(
              textColor: Colors.black,
              textInputType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Value Cannot be Empty";
                }
                if (!value.isDigit()) {
                  return "Invalid Quantity";
                }
              },
            ),
          )),
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          height: 250.h,
          width: 500.w,
          child: RedBackgroundWhiteTextElevatedButton(
            text: "SUBMIT",
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _buildAlertItems(Product product, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35.h,
        ),
        Text(
          product.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: k2c2b2bColor,
              fontSize: 25,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.w100),
        ),
        SizedBox(
          height: 35.h,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 4,
            ),
          ),
          child: Image.network(
            product.productImages[0].image!,
            height: 534.h,
            width: 900.w,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        child,
      ],
    );
  }
}
