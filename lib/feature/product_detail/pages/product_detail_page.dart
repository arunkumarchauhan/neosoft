import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_state.dart';
import 'package:neostore/feature/product_detail/widgets/product_detail_card_widget.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/feature/shared/buttons/grey_background_dark_grey_text_elevated_button.dart';
import 'package:neostore/feature/shared/buttons/red_background_white_text_elevated_button.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

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
            appBar: AppBar(
              title: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline2,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                )
              ],
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
              ),
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
                              text: "BUY NOW", onPressed: () {}),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Flexible(
                            child: GreyBackgroundDarkGreyTextElevatedButton(
                          text: "RATE",
                          onPressed: () {},
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
}
